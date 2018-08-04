# frozen_string_literal: true

# duh
module Sinatra
  # sessions helper
  module SessionsHelper
    def current_user=(user)
      @current_user = user
    end

    def current_user
      @current_user ||= User[session[:current_user]]
    end

    def sign_in(user)
      session[:current_user] = user.id
      self.current_user = user
    end

    def sign_out
      session.delete(:current_user)
    end

    def signed_in?
      !current_user.nil?
    end
  end

  helpers SessionsHelper
end
