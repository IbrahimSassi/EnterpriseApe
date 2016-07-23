ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.smtp_settings ={
  :address          => 'smtp.sendgrid.net',
  :port             => '587',
  :authentication   => :plain,
  :user_name        => 'UsernameThatWePutItInTheCongig:get Command',
  :password          => 'same thingsss',
  :domain            => 'heroku.com',
  :enable_starttls_auto => true
  }