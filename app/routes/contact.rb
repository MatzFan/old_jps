# frozen_string_literal: true

module Jps
  module Routes
    # the Contact page
    class Contact < Base
      get '/contact' do
        haml :contact
      end

      post '/contact' do
        Pony.mail(to:          'bruce.steedman@gmail.com',
                  subject:     "Enquiry from #{params[:name]}",
                  body:        "From: #{params[:email]}\n\n#{params[:msg]}",
                  via_options: settings.mail_options)
        redirect back
      end
    end
  end
end
