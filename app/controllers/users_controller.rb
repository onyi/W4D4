class UsersController < ApplicationController

  def show

  end

  def new

    render :new
  end


  def create

    login!(user)
    redirect_to home_url #TODO
  end

  


end
