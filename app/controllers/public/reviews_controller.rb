class Public::ReviewsController < ApplicationController
  before_action :authenticate_user!
  before_action :is_matching_login_user, only: [:edit, :update]
  
  def new
    @post = Post.find(params[:post_id])
    @review = Review.new
  end
  
  def create
    @post = Post.find(params[:post_id])
    @review = current_user.reviews.new(review_params)
    @review.post_id = @post.id
    if @review.save
      flash[:success] = "投稿に成功しました"
      redirect_to post_path(@post)
    else
      flash.now[:danger] = "投稿に失敗しました"
      render "new"
    end
  end

  def index
    @post = Post.find(params[:post_id])
  end

  def edit
    @post = Post.find(params[:post_id])
    @review = Review.find(params[:id])
  end
  
  def update
    @post = Post.find(params[:post_id])
    @review = Review.find(params[:id])
    if @review.update(review_params)
      flash[:success] = "変更を保存しました"
      redirect_to post_reviews_path(@post)
    else
      flash.now[:danger] = "保存に失敗しました"
      render :edit
    end  
  end
  
  def destroy
    post = Post.find(params[:post_id])
    Review.find(params[:id]).destroy
    flash[:success] = "削除に成功しました"
    redirect_to post_path(post.id)
  end
  
  private
  
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
