# frozen_string_literal: true

# ApplicationController
class ApplicationController < ActionController::Base
  before_action :current_user

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def require_login
    session_user_nil
    redirect_to root_url if current_user.nil?
  end

  def session_user_nil
    @current_user = session[:user_id] = nil if current_user.nil?
  end
end
