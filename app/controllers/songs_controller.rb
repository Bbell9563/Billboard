class SongsController < ApplicationController
  before_action :set_artist
  before_action :set_song, only: [:update, :edit, :destroy, :show]
  def index
    @songs = @artist.songs
  end

  def show
  end

  def new
    @song = Song.new(artist_id: params[:artist_id])
    render partial: 'form'
  end

  def create
    @song = @artist.songs.new(song_params)
    if @song.save
      redirect_to artist_path(@artist)
    else  
      render partial: 'form', notice: "something went wrong"
    
    end
  end

  # def new 
  #   @item = Item.new(department_id: params[:department_id])
  #   render partial: 'form'
  # end 
  # def create
  #   @item = @department.items.new(item_params)
  #   if @item.save
  #     redirect_to department_items_path(@department)
  #   else  
  #     render :new 
  #   end
  # end


  def edit
  end

  def update

  end

  private
    def set_artist
      @artist = Artist.find(params[:artist_id])
    end

    def set_song
      @song = Song.find(params[:id])
    end

    def song_params
      params.require(:song).permit(:name, :genre)
    end
end
