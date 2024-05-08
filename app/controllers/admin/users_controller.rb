class Admin::UsersController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  
  def show
    @posts = @user.posts
  end
  
  def edit
  end
  
  def update
    if @user.update(user_params)
      redirect_to admin_user_path(@user.id)
      flash[:notice] = "変更が保存されました"
    else
      render :edit
      flash[:alert] = "変更に失敗しました"
    end
  end
  
  def destroy
    if @user.destroy
      redirect_to admin_path
      flash[:notice] = "退会処理に成功しました"
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
