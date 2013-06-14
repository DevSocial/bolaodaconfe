# encoding: UTF-8

class ApplicationController < ActionController::Base
  delegate :current_user, :user_signed_in?, :to => :user_session
  helper_method :current_user, :user_signed_in?
  protect_from_forgery

  def user_session
    UserSession.new(session)
  end

  def require_authentication
    unless user_signed_in?
      redirect_to new_user_sessions_path,
        :alert => 'Para continuar, você precisa estar logado'
    end
  end

  def require_no_authentication
    redirect_to matches_url if user_signed_in?
  end
end
