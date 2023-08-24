every 1.day, at: '9:00 am' do
  rake "send_reminder_emails:send_emails"
end