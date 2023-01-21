class BooksController < ApplicationController
  def top
  end
  
  def new
    @book = book.new
  end
end
