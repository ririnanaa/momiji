class Admin::UsersController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  
  def show
    @posts = @user.posts.page(params[:page]).order(created_at: :desc)
    @reviews = @user.reviews
  end
  
  def edit
  end
  
  def update
    if @user.update(user_params)
      flash[:success] = "変更が保存されました"
      redirect_to admin_user_path(@user.id)
    else
      flash[:danger] = "変更に失敗しました"
      render :edit
    end
  end
  
  def destroy
    if @user.destroy
      flash[:success] = "退会処理に成功しました"
      redirect_to admin_path
    end
  end
  
  private
  
  def set_user
    @user = User.find(params[:id])
  end 
  
  def user_params
    params.require(:user).permit(:profile_image, :name, :email, :is_general, :is_active )
  end
  
end
