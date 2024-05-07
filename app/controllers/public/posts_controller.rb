class Public::PostsController < ApplicationController
   before_action :authenticate_user!, except: [:index, :show]
   
  def new
    @post = Post.new
  end
  
  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      flash[:notice] = "登録に成功しました"
      redirect_to post_path(@post.id)
    else
      flash.now[:alert] = "登録に失敗しました"
      render "new"
    end
  end

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end
  
  def destroy
    post = Post.find(params[:id])
    if post.destroy
      flash[:notice] = "削除しました"
      redirect_to posts_path
    else
      flash.now[:alert] = "削除できませんでした"
      render :show
    end
  end
  
  def edit
    @post = Post.find(params[:id])
  end
  
  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      flash[:notice] = "変更を保存しました"
      redirect_to post_path(@post.id)
    else
      flash.now[:alert] = "失敗しました"
      render :edit
    end
  end
  
  private
  
  def post_params
    params.require(:post).permit(:name, :post_image, :daytime, :place, :address, :body, genre_ids:[], category_ids:[])
  end
end

