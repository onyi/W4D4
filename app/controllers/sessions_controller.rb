class SessionsController < ApplicationController

  # before_action :require_no_user!

  def new
    @user = User.new
    render :new
  end

  def create
    user = User.find_by_credentials(
      params[:users][:email],
      params[:users][:password]
    )
    if user.nil?
      flash.now[:errors] = ["User does not exists!"]
      redirect_to session_new_url
    # Redirect to main 
    else
      if user.is_password?(params[:users][:password])
        redirect_to user_url(user)
      else
        flash.now[:errors] = ["Password is incorrect!"]
        redirect_to session_new_url
      end
    end
  end

  def destroy
    logout!
    redirect_to new_session_url
  end

end
