class ArtistsController < ApplicationController
  def index
    if params[:sort]
      @artists = Artist.order(name: params[:sort])
    else
      @artists = Artist.all
    end
  end

  def new
  end

  def create
    artist = Artist.create(artist_params)
    binding.pry
    if artist.id != nil
      redirect_to '/artists'
    elsif artist.errors[:name] == "can't be blank"
      flash[:notice] = "Need a name!"
      render :new
    else
      flash[:notice] = "Name needs to be 5 chars!"
      render :new
    end
  end

  def destroy
    Artist.destroy(params[:id])
    redirect_to '/artists'
  end

  def edit
    @artist = Artist.find(params[:id])
  end

  def update
    artist = Artist.find(params[:id])
    artist.update(artist_params)
    redirect_to '/artists'
  end

  private
  def artist_params
    params.permit(:name)
  end
end
