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
    if artist.id != nil
      redirect_to '/artists'
    else
      flash[:alert] = artist.errors.full_messages.to_sentence
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
