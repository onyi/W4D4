class SessionsController < ApplicationController

  before_action :require_no_user!

  def new
    # debugger
    @user = User.new
    render :new
  end

  def create
    debugger
    user = User.find_by_credentials(
      params[:users][:user_name],
      params[:users][:password]
    )
    if user.nil?
      flash[:errors] = ["User does not exists!"]
      redirect_to new_session_url
    # Redirect to main 
    else
      if user.is_password?(params[:users][:password])
        log_in_user!(user)
        redirect_to bands_url
      else
        flash[:errors] = ["Password is incorrect!"]
        redirect_to new_session_url
      end
    end
  end

  def destroy
    logout!
    redirect_to new_session_url
  end

end
