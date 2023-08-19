# Preview all emails at http://localhost:3000/rails/mailers/reminder_mailer
class ReminderMailerPreview < ActionMailer::Preview
  def expiration_reminder(stock)
    @stock = stock
    @period = calculate_period(stock.expiration_date)
    mail(
      to: stock.user.email,
      subject: '賞味期限のお知らせ'
    )
  end

  private
  def calculate_period(expiration_date)
    days_until_expiration = (expiration_date - Date.today).to_i

    if days_until_expiration <= 7
      '1週間'
    elsif days_until_expiration <= 30
      '1ヶ月'
    else
      'in the future'
    end
  end
end
