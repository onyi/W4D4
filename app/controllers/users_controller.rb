class UsersController < ApplicationController
  
  # before_action :require_no_user!

  def show
    @user = User.find_by(id: params[:id])
    render :show
  end

  def new
    debugger
    @user = User.new
    render :new
  end


  def create
    @user = User.new(user_params)
    debugger
    if @user.save
      log_in_user!(@user)
      redirect_to user_url(@user)
    else
      flash.now[:errors] = @user.errors.full_messages
      redirect_to new_user_url
    end
  end

  private

  def user_params
    params.require(:users).permit(:user_name, :password, :email)
  end


end
