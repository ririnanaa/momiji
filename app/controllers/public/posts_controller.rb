class Public::PostsController < ApplicationController
   before_action :authenticate_user!, except: [:index, :show]
   before_action :set_post, only: [:show, :edit, :update]
   before_action :is_matching_login_user, only: [:edit, :update]
   
  def new
    @post = Post.new
  end
  
  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      flash[:success] = "登録に成功しました"
      redirect_to post_path(@post.id)
    else
      flash.now[:danger] = "登録に失敗しました"
      render "new"
    end
  end

  def index
    @posts = Post.page(params[:page]).order(created_at: :desc)
  end
  
  def show
  end
  
  def destroy
    post = Post.find(params[:id])
    if post.destroy
      flash[:success] = "削除しました"
      redirect_to "/#{current_user.name}"
    else
      render :show
    end
  end
  
  def edit
  end
  
  def update
    if @post.update(post_params)
      flash[:success] = "変更を保存しました"
      redirect_to post_path(@post.id)
    else
      flash.now[:danger] = "登録に失敗しました"
      render :edit
    end
  end
  
  private
  
  def set_post
    @post = Post.find(params[:id])
  end
  
  def is_matching_login_user
    post = Post.find(params[:id])
    unless post.user_id == current_user.id
      redirect_to posts_path
    end
  end
  
  def post_params
    params.require(:post).permit(:name, :post_image, :day, :close_day, :hour, :url, :place, :address, :body, genre_ids:[], category_ids:[])
  end
end

