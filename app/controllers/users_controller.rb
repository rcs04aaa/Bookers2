class UsersController < ApplicationController
  
  before_action :correct_user, only: [:edit, :update]
  
  def top
  end

  def index
    @user = current_user
    @users = User.all
    @book = Book.new
  end
  
  def create
    @user = User.new
      name:params[:name]
      image_name:"default_user.jpg"
  end

  def show
    @user = User.find(params[:id])
    @book = Book.new
    @books = @user.books
  end
  
  def update
    @user=User.find(params[:id])
    # @user.name=params[:name]
    # @user.email=params[:email]
    # @user.image_name="#{@user.id}.jpg"
    @user.update(user_params)
    flash[:notice] = "You have updated user successfully."
    redirect_to user_path(@user)
  end

  def edit
    @user = User.find(params[:id])
  end
  
private
  
  def user_params
    params.require(:user).permit(:name, :introduction, :image)
  end
  
  def correct_user
    @user = User.find(params[:id])
    redirect_to user_path(current_user) unless @user == current_user
  end
  
end
