class ApplicationController < ActionController::Base
  # Globally available method for a controller

  helper_method :current_user, :logged_in?, :auth_token

  private
  def require_no_user!
    redirect_to albums_url if current_user
  end

  def current_user
    return nil unless session[:session_token]
    @current_user ||= User.find_by(session_token: session[:session_token])
  end

  def log_in_user!(user)
    # Set session token to cookies
    session[:session_token] = user.reset_session_token!

  end

  def logged_in?
    !!current_user #wow such hacky
  end

  def logout!
    current_user.reset_session_token! # obtain user object from #current_user method
    session[:session_token] = nil
  end

  def auth_token
    html = " <input " 
    html += " type=\"hidden\" "
    html += " name=\"authenticity_token\" "
    html += " value=\"<%= #{form_authenticity_token} %>\" >"
    html.html_safe
  end

end
 