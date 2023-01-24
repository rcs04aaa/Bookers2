class BooksController < ApplicationController
  
  def top
  end

  def index
    @book = Book.new
    @books = Book.all
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      flash[:notice] = "Book was successfully created.xxx"
      redirect_to book_path(@book.id)
    else
      @books = Book.all
      render :index
    end
  end
  
  def show
    @book = Book.find(params[:id])
    flash[:notice] = "You have created book successfully."
  end
  
  def edit
  end
  
private

  def book_params
    params.require(:book).permit(:title, :body)
  end
end
