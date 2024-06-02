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
      flash[:notice] = "登録に成功しました"
      redirect_to post_path(@post.id)
    else
      flash.now[:alert] = "登録に失敗しました"
      render "new"
    end
  end

  def index
    @genres = Genre.all
    @categories = Category.all
    if params[:genre_id]
      @genre = @genres.find(params[:genre_id])
      all_posts = @genre.posts
    elsif params[:category_id]
      @category = @categories.find(params[:category_id])
      all_posts = @category.posts
    else
      all_posts = Post.all
    end
    
    if params[:latest]
      @posts = Post.latest.page(params[:page]).joins(:user).where(users: { is_active: true })
    elsif params[:old]
      @posts = Post.old.page(params[:page]).joins(:user).where(users: { is_active: true })
    elsif params[:liked]
      @posts = Post.liked.page(params[:page]).joins(:user).where(users: { is_active: true })
    else 
      @posts = all_posts.page(params[:page]).order(created_at: :desc).joins(:user).where(users: { is_active: true })
    end
  end
  
  def show
    @reviews = @post.reviews.includes(:user).order(created_at: :desc).joins(:user).where(users: { is_active: true })
    @reviews_latest5 = @reviews.first(5)
  end
  
  def destroy
    post = Post.find(params[:id])
    if post.destroy
      flash[:notice] = "削除しました"
      redirect_to "/#{current_user.name}"
    else
      render :show
    end
  end
  
  def edit
  end
  
  def update
    if @post.update(post_params)
      flash[:notice] = "変更を保存しました"
      redirect_to post_path(@post.id)
    else
      flash.now[:alert] = "登録に失敗しました"
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
