class UsersController < ApplicationController
  def top
  end
  
  def index
    @users = User.all
    @book = Book.new
  end
  
  def show
    @user = User.find(params[:id])
    flash[:notice] = "Welcome! You have signed up successfully."
  end
  
  def edit
    @user = user
  end
end
