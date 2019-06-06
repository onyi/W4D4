class AlbumsController < ApplicationController

  def index
    @albums = Album.all
    render :index
  end

  def create
    album = Album.new(album_params)
    if album.save
      redirect_to album_url(album)
    else
      flash[:errors] = album.errors.full_messages
      redirect_to new_album_url
    end
  end

  def new
    @album = Album.new(band_id: params[:band_id])
    render :new
  end

  def edit
    @album = Album.find_by(id: params[:id])
    render :edit
  end

  def show
    @album = Album.find_by(id: params[:id])
    render :show
  end

  def update
    @album = Album.find_by(id: params[:id])
    if @album
      if @album.update_attributes(album_params)
        redirect_to album_url(@album)
      else
        flash.now[:errors] = @album.errors.full_messages
        render :edit
      end
    else
      #When album does not exists, AKA someone calls controller method directly
      flash.now[:error] = ["Album does not exists!!!"]
      render :index
    end
    redirect_to album_url(@album)
  end

  def destroy
    @album = Album.find_by(id: params[:id])
    if @album
      @album.destroy
    else
      flash.now[:error] = ["Album does not exists!!! Cannot Delete!"]
    end
    render :index
  end

  private

  def album_params
    params.require(:albums).permit(:title, :year, :band_id)
  end

end
