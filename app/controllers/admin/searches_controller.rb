class Admin::SearchesController < ApplicationController
  before_action :authenticate_admin!
  
  def search
    @range = params[:range]
    @word = params[:word]
    @method = params[:method]
    if @range == "User"
      @users = User.looks(@word, @method)
    else
      @posts = Post.looks(@word, @method)
    end
  end
  
end
