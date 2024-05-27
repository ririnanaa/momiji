class Admin::PostsController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_post, only: [:show, :destroy]
  
  def show
    @reviews = @post.reviews.includes(:user).order(created_at: :desc)
    @reviews_latest5 = @reviews.first(5)
  end
  
  def destroy
    if @post.destroy
      flash[:notice] = "削除しました"
      redirect_to admin_user_path(@post.user.id)
    end
  end
  
  def set_post
    @post = Post.find(params[:id])
  end
  
end
