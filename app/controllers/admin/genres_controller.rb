class Admin::GenresController < ApplicationController
   before_action :authenticate_admin!
   before_action :set_genre, only: [:edit, :update]

  def index
    @genre = Genre.new
    @genres = Genre.all
  end

  def create
    @genre = Genre.new(genre_params)
    if @genre.save
      flash[:notice] = "登録に成功しました"
      redirect_to admin_genres_path
    else
      flash.now[:alert] = "登録に失敗しました"
      @genres = Genre.all
      render :index
    end
  end

  def edit
  end

  def update
    if @genre.update(genre_params)
      flash[:notice] = "変更が保存されました"
      redirect_to admin_genres_path
    else
      render "edit"
    end
  end

  def destroy
    genre = Genre.find(params[:id])
    if genre.destroy
      flash[:notice] = "削除に成功しました"
      redirect_to admin_genres_path
    else
      render :index
    end
  end

  private

  def set_genre
    @genre = Genre.find(params[:id])
  end

  def genre_params
    params.require(:genre).permit(:name)
  end
end
