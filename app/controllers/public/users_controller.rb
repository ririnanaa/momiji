class Public::UsersController < ApplicationController
  before_action :authenticate_user!, only: [:edit, :update]
  before_action :set_user, only: [:show, :edit, :update]
  before_action :is_matching_login_user, only: [:edit, :update]
  before_action :ensure_normal_user, only: [:update]
  
  def show
    @posts = @user.posts
  end
  

  def edit
  end
  
  def update
    if @user.update(user_params)
      redirect_to "/#{@user.name}"
      flash[:notice] = "変更が保存されました"
    else
      render :edit
      flash.now[:alert] = "変更に失敗しました"
    end
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
 
  def ensure_normal_user
    if @user.email == 'guest@example.com'
      redirect_to root_path
      flash[:alert] = 'ゲストユーザーは更新できません。'
    end
  end
end
