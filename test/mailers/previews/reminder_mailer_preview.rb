# Preview all emails at http://localhost:3000/rails/mailers/reminder_mailer
class ReminderMailerPreview < ActionMailer::Preview
  def expiration_reminder
    stock = Stock.find(10)
    RemainderMailer.expiration_reminder(stock)
  end
end
