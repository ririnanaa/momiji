class Public::SearchesController < ApplicationController
  
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
