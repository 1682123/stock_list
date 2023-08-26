class ReminderMailer < ApplicationMailer
  default from: 'no-reply-stolis@example.com'

  def expiration_reminder(stock)
    @stock = stock
    mail(
      to: stock.user.email,
      subject: '賞味期限のお知らせ'
    )
  end
end
