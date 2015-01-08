class UsersController < ApplicationController

  def index
    @users = User.all
  end 

  def show
      #debugger
      @user = User.find(params[:id])
      @posts = @user.posts
  end
end
