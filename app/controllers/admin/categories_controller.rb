class Admin::CategoriesController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_categories, only: [:edit, :update]
   
  def index
    @category = Category.new
    @categories = Category.all
  end
  
  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:success] = "登録に成功しました"
      redirect_to admin_categories_path
    else
      flash.now[:danger] = "登録に失敗しました"
      render :index
    end
  end

  def edit
  end
  
  def update
    if @category.update(category_params)
      flash[:success] = "変更が保存されました"
      redirect_to admin_categories_path
    else
      render :edit
    end
  end
  
  def destroy
    category = Category.find(params[:id])
    if category.destroy
      flash[:success] = "削除に成功しました"
      redirect_to admin_categories_path
    else
      flash.now[:danger] = "削除に失敗しました"
      render :index
    end
  end
  
  private
  
  def set_categories
    @category = Category.find(params[:id])
  end  
  
  def category_params
    params.require(:category).permit(:name)
  end
end
