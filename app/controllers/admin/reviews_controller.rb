class Admin::ReviewsController < ApplicationController
  before_action :authenticate_admin!
   
  def index
    @post = Post.find(params[:post_id])
  end
  
  def destroy
    post = Post.find(params[:post_id])
    Review.find(params[:id]).destroy
    flash[:success] = "削除に成功しました"
    redirect_to admin_post_path(post.id)
  end
  
end
