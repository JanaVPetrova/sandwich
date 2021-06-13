class ApplicationController < ActionController::Base
  helper_method :current_user, :signed_in?

  def current_user
    @current_user ||= begin
      return unless session[:user_id]

      User.find(session[:user_id])
    end
  end

  def signed_in?
    current_user.present?
  end
end
