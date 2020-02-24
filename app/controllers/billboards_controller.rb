class BillboardsController < ApplicationController
  before_action :set_billboard, only: [:show, :edit, :update, :destroy, :new_song, :add_song, :remove_song]
  
  def index
    @billboards = Billboard.all
  end

  def show
    @songs = @billboard.songs
  end

  def new_song
    # @artists = Artist.all
    @songs = Song.all.where(billboard_id: nil)
    
  end

  def add_song
    @billboard.songs << Song.find(params[:song_id])
    redirect_to billboard_path(@billboard)
  end

  def remove_song
    Song.find(params[:song_id]).update(billboard_id: nil)
    redirect_to billboard_path(@theater)
  end

  def new
    @billboard = Billboard.new
    render partial: 'billboard_form'
  end

  def create
    @billboard = Billboard.new(billboard_params)
    if @billboard.save
      redirect_to billboards_path
    else  
      render :new 
    end
  end

  def edit
    render partial: 'billboard_form'
  end

  def update
    if @billboard.update(billboard_params)
      redirect_to billboard_path(@billboard)
    else  
      render :update
    end
  end



  private 

    def set_billboard
      @billboard = Billboard.find(params[:id])
    end

    def billboard_params
      params.require(:billboard).permit(:name)
    end
end
