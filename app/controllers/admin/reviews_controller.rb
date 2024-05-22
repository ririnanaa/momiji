class Admin::ReviewsController < ApplicationController
  before_action :authenticate_admin!
   
  def index
    @post = Post.find(params[:post_id])
    @reviews = @post.reviews.includes(:user).order(created_at: :desc).page(params[:page])
  end
  
  def destroy
    post = Post.find(params[:post_id])
    Review.find(params[:id]).destroy
    flash[:success] = "削除に成功しました"
    redirect_to admin_post_path(post.id)
  end
  
end
