# frozen_string_literal: true

module Jps
  module Routes
    # the Contact page
    class Contact < Base
      get '/contact' do
        haml :contact
      end

      post '/contact' do
        Pony.mail(to: 'bruce.steedman@gmail.com',
                  subject:     "Enquiry from #{params[:name]}",
                  body:        "From: #{params[:email]}\n\n#{params[:msg]}",
                  via_options: MailConfig.mail_options)
        @msg = { success: 'Message sent!' }
        haml :contact
      end
    end
  end
end
