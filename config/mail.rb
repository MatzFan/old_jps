# frozen_string_literal: true

# mail options
module MailConfig
  def self.mail_options
    { address:              'smtp.gmail.com',
      port:                 '587',
      enable_starttls_auto: true,
      user_name:            'jerseypropertyservices@gmail.com',
      password:             ENV['GMAIL_PASSWORD'],
      authentication:       :plain }
  end
end
