class BooksController < ApplicationController
  def top
  end

  def new
    @book = book.new
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
    redirect_to book_path
  end
  
  private

  def book_params
    params.require(:book).permit    # (:shop_name, :image, :caption)
  end
end
