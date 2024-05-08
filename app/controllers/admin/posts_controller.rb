class Admin::PostsController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_post, only: [:show, :destroy]
  
  def show
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
