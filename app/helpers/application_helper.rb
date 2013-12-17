module ApplicationHelper
  def current_user
    @current_user ||= User.find_by_token(session[:token])
  end
end
