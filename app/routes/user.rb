# frozen_string_literal: true

module Jps
  module Routes
    # the Contact page
    class UserRoutes < Base
      get '/users/register' do
        haml :register
      end

      post '/users/create' do
        @user = User.new email: params[:email], name: params[:name]
        @user.password = params[:password] # User model method
        if @user.save
          # Pony.mail(to: 'bruce.steedman@gmail.com',
          #           subject:     "Enquiry from #{params[:name]}",
          #           body:        "From: #{params[:email]}\n\n#{params[:msg]}",
          #           via_options: MailConfig.mail_options)
          @msg = { success: 'Message sent!' }
          redirect '/login'
        else
          @msg = { failure: 'There was a problem, please try again' }
          haml :register # refresh the page (with warnings)
        end
      end
    end
  end
end
