module ApplicationHelper
  def current_user
    @current_user ||= begin
      return unless session[:user_id]

      User.find(session[:user_id])
    end
  end

  def sign_in(user)
    session[:user_id] = user.id
  end

  def sign_out
    session[:user_id] = nil
  end

  def signed_in?
    current_user.present?
  end
end
