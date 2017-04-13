 if Rails.env.development? || Rails.env.production?
    ActionMailer::Base.delivery_method = :smtp
    ActionMailer::Base.smtp_settings = {
      address:        'smtp.sendgrid.net',
      port:           '2525',
      authentication: :plain,
      user_name:      "app64683711@heroku.com",
      password:       "t6jd4tgy5402",
      domain:         'heroku.com',
      enable_starttls_auto: true
    }
  end