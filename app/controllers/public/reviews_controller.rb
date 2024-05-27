class Public::ReviewsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_post, only: [:new, :create, :index, :edit, :update]
  before_action :is_matching_login_user, only: [:edit, :update]
  
  def new
    @review = Review.new
  end
  
  def create
    @review = current_user.reviews.new(review_params)
    @review.post_id = @post.id
    if @review.save
      flash[:notice] = "投稿に成功しました"
      redirect_to post_path(@post)
    else
      flash.now[:alert] = "投稿に失敗しました"
      render "new"
    end
  end

  def index
    @reviews = @post.reviews.includes(:user).order(created_at: :desc).joins(:user).where(users: { is_active: true }).page(params[:page])
  end

  def edit
    @review = Review.find(params[:id])
  end
  
  def update
    @review = Review.find(params[:id])
    if @review.update(review_params)
      flash[:notice] = "変更を保存しました"
      redirect_to post_reviews_path(@post)
    else
      flash.now[:alert] = "保存に失敗しました"
      render :edit
    end  
  end
  
  def destroy
    post = Post.find(params[:post_id])
    Review.find(params[:id]).destroy
    flash[:notice] = "削除に成功しました"
    redirect_to post_path(post.id)
  end
  
  private
  
  def set_post
    @post = Post.find(params[:post_id])
  end
  
  def is_matching_login_user
    review = Review.find(params[:id])
    unless review.user_id == current_user.id
      redirect_to posts_path
    end
  end
  
  def review_params
    params.require(:review).permit(:rate, :day, :time, :congestion, :title, :body)
  end
end
