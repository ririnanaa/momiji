class Public::SearchesController < ApplicationController
  
  def search
    @range = params[:range]
    @word = params[:word]
    if @range == "User"
      @users = User.looks(params[:searach], params[:word])
    else
      @posts = Post.looks(params[:search], params[:word])
    end
  end
  
end
