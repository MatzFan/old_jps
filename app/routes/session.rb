# frozen_string_literal: true

module Jps
  module Routes
    # the login page
    class Session < Base
      get '/login' do
        haml :session
      end

      post '/sessions/create' do
        @user = User.find(email: params[:email])
        if @user && @user.password == params[:password]
          sign_in @user
          @msg = { success: "Welcome back #{@user.name}" }
          redirect '/applications/index'
        else
          redirect '/login'
        end
      end

      get '/logout' do
        sign_out
        redirect '/'
      end
    end
  end
end
