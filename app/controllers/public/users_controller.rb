class Public::UsersController < ApplicationController
  before_action :authenticate_user!, only: [:edit, :update]
  before_action :set_user, only: [:show, :edit, :update]
  before_action :is_matching_login_user, only: [:edit, :update]
  before_action :ensure_normal_user, only: [:update]
  
  def show
    @posts = @user.posts.page(params[:page]).order(created_at: :desc)
    @reviews = @user.reviews.page(params[:page]).order(created_at: :desc)
  end

  def edit
  end
  
  def update
    if @user.update(user_params)
      flash[:notice] = "変更が保存されました"
      redirect_to "/#{@user.name}"
    else
      flash.now[:alert] = "変更に失敗しました"
      render :edit
    end
  end
  
  def likes
    @user = User.find(params[:id])
    likes = Like.where(user_id: @user.id).pluck(:post_id)
    @like_posts = Post.find(likes)
  end
  
  private
  
  def set_user
    @user = User.find_by(name: params[:name])
  end
  
  def is_matching_login_user
    user = User.find_by(name: params[:name])
    unless user.id == current_user.id
      redirect_to "/#{current_user.name}"
    end
  end
  
  def user_params
    params.require(:user).permit(:profile_image, :name, :introduction, :email )
  end
 
 #ゲストログイン時のユーザー編集不可
  def ensure_normal_user
    if @user.email == 'guest@example.com'
      flash[:error] = 'ゲストユーザーは更新できません。'
      redirect_to root_path
    end
  end
end
