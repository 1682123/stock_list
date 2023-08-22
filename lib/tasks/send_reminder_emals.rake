namespace :send_reminder_emals do
  desc "賞味期限より１ヶ月前と１週間前のメール通知"
  task :send_emails => :environment do
    stocks_expiring_in_one_week = Stock.expiring_in_one_week
    stocks_expiring_in_one_month = Stock.expiring_in_one_month

    stocks_expiring_in_one_week.each do |stock|
      ReminderMailer.expiration_reminder(stock).deliver_now
    end

    stocks_expiring_in_one_month.each do |stock|
      ReminderMailer.expiration_reminder(stock).deliver_now
    end
  end
end
