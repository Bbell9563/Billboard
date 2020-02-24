class CommentsController < ApplicationController
  before_action :set_song
  def new
    @comment
  end

  def new
    @comment = Comment.new
  end

  def create
    @comment = @song.comments.new(comment_params)
    if @comment.save
      redirect_to artist_song_path(@song.artist_id, @song)
    else  
      render :new
    end
  end


  
  private 
    def set_song 
      @song = Song.find(params[:song_id])
    end

    def comment_params
      params.require(:comment).permit(:author, :body)
    end

end
