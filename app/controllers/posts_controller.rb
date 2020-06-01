class PostsController < ApplicationController
  before_action :set_genre

  def index
    @post = Post.new
    @posts = @genre.posts.includes(:user).order("created_at DESC")
  end

  def create
    @post = @genre.posts.new(post_params)
    
    url = params[:post][:youtube_url]
    url = url.last(11)
    @post.youtube_url = url

    if @post.save
      redirect_to genre_posts_path(@genre), notice:'メッセージが送信されました'
    else
      @posts = @genre.posts.includes(:user)
      flash.now[:alert] = 'メッセージを入力してください。'
      render :index
    end
  end

  private

  def post_params
    params.require(:post).permit(:reason, :youtube_url, :video).merge(user_id: current_user.id)
  end

  def set_genre
    @genre = Genre.find(params[:genre_id])
  end
end
