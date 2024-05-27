class Public::RetirementsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_current_user, only: [:new, :destroy]
  before_action :ensure_normal_user, only: [:destroy]
  
  def new
  end
  
  def destroy
    @user.destroy
    redirect_to new_user_registration_path
    flash[:notice] = "退会が完了しました"
  end
  
   private

  def set_current_user
    @user = current_user
  end
  
  def ensure_normal_user
    if @user.email == 'guest@example.com'
      redirect_to root_path
      flash[:error] = 'ゲストユーザーは退会できません。'
    end
  end
end
