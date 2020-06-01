class GenresController < ApplicationController

  def index
  end

  def new
    @genre = Genre.new
    @genre.users << current_user
  end

  def create
    @genre = Genre.new(genre_params)
    if @genre.save
      redirect_to root_path, notice: '新しいジャンルを作成しました'
    else
      render :new
    end
  end

  def edit
    @genre = Genre.find(params[:id])
  end

  def update
    @genre = Genre.find(params[:id])
    if @genre.update(genre_params)
      redirect_to genre_posts_path(@genre), notice: 'グループを更新しました'
    else
      render :edit
    end
  end

  private
  def genre_params
    params.require(:genre).permit(:name, user_ids: [])
  end

end
