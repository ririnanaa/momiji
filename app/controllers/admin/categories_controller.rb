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
      flash[:notice] = "登録に成功しました"
      redirect_to admin_categories_path
    else
      flash.now[:alert] = "登録に失敗しました"
      @categories = Category.all
      render :index
    end
  end

  def edit
  end
  
  def update
    if @category.update(category_params)
      flash[:notice] = "変更が保存されました"
      redirect_to admin_categories_path
    else
      render :edit
    end
  end
  
  def destroy
    category = Category.find(params[:id])
    if category.destroy
      flash[:notice] = "削除に成功しました"
      redirect_to admin_categories_path
    else
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
