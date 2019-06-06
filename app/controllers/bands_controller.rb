class BandsController < ApplicationController

  def index
    @bands = Band.all
    render :index
  end

  def create
    band = Band.new(band_params)
    if band.save
      redirect_to band_url(band)
    else
      flash.now[:errors] = band.errors.full_messages
      redirect_to new_band_url
    end
  end

  def new
    @band = Band.new
    render :new
  end

  def edit
    @band = Band.find_by(id: params[:id])
    if @band.update_attributes(band_params)
      redirect_to band_url(@band)
    else
      flash.now[:errors] = @band.errors.full_messages
    end
    render :edit
  end

  def show
    @band = Band.find_by(id: params[:id])
    render :show
  end

  def update
    @band = Band.find_by(id: params[:id])
    if @band
      if @band.update_attributes(band_params)
        redirect_to band_url(@band)
      else
        flash.now[:errors] = @band.errors.full_messages
        render :edit
      end
    else
      #When band does not exists, AKA someone calls controller method directly
      flash.now[:error] = ["Band does not exists!!!"]
      render :index
    end
    redirect_to band_url(@band)
  end

  def destroy
    @band = Band.find_by(id: params[:id])
    if @band
      @band.destroy
    else
      flash.now[:error] = ["Band does not exists!!! Cannot Delete!"]
    end
    redirect_to bands_url
  end

  private

  def band_params
    params.require(:bands).permit(:name)
  end



end
