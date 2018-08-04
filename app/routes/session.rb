# frozen_string_literal: true

module Jps
  module Routes
    # the login page
    class Session < Base
      get '/login' do
        haml :session
      end

      post '/sessions/create' do
        @user = User.find email: params[:email]
        if @user && @user.password == params[:password]
          sign_in @user
          # @user.authenticity_token = SecureRandom.hex
          # thirty_days_in_seconds = 30 * 24 * 60 * 60
          # response.set_cookie('permanent_cookie',
          #                     value: { domain: 'jerseypropertyservices.com', path: '/'},
          #                     max_age: thirty_days_in_seconds.to_s)
          # @user.save # with cookie
          @msg = { success: "Welcome back #{@user.name}" }
          redirect '/applications/index'
        else
          # msg fail
          redirect '/login'
        end
      end

      get '/logout' do
        sign_out
        # msg
        redirect '/'
      end
    end
  end
end

# post :create, map: '/create' do
#     @user = User.find(email: params[:email])
#     if @user && @user.confirmation && @user.password == params[:password]
#       if @user.subscription
#         if params[:remember_me]
#           @user.authenticity_token = SecureRandom.hex
#           thirty_days_in_seconds = 30 * 24 * 60 * 60
#           response.set_cookie('permanent_cookie', value:
#                                         { domain: 'jerseypropertyservices.com', path: '/'},
#                                         max_age: "#{thirty_days_in_seconds}")
#           @user.save
#         end
#         flash[:notice] = "Welcome back #{@user.name.split(' ').first}."
#         sign_in(@user) # defined in helpers/sessions
#         redirect 'applications/index'
#       else
#         redirect "users/#{@user.id}/subscribe"
#       end
#     else
#       render :new, locals: { error: true }
#     end
#   end

#   get :destroy, map: '/logout' do
#     sign_out
#     flash[:notice] = 'You have successfully logged out.'
#     redirect '/'
#   end