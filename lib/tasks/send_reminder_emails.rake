namespace :send_reminder_emails do
  desc "賞味期限より１ヶ月前と１週間前、当日のメール通知"
  task :send_emails => :environment do
    stocks_to_notify = Stock.expiring_in_one_month.or(Stock.expiring_in_one_week).or(Stock.today)
    # stocks_to_notify = Stock.expiring_in_one_month.or(Stock.expiring_in_one_week)

    stocks_to_notify.each do |stock|
      ReminderMailer.expiration_reminder(stock).deliver_now
    end
  end
end
