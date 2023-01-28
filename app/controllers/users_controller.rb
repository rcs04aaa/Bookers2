class UsersController < ApplicationController
  def top
  end

  def index
    @users = User.all
    @current_user = User.find_by(id:session[:user_id])
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
    flash[:notice] = "You have created book successfully."
  end
  
  def update
    @user=User.find_by(id: params[:id])
    @user.name=params[:name]
    @user.email=params[:email]
    @user.image_name="#{@user.id}.jpg"
    flash[:notice] = "Book was successfully updated."
  end

  def edit
    @user = User.find(params[:id])
    @current_user = User.find_by(id:session[:user_id])
  end
  
private
  
  def user_params
    params.require(:user).permit(:name, :introduction, :image)
  end
end
