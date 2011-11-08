class BooksController < ApplicationController
  def index
    @title = "Книги"
    @books = Book.all
  end
  
  def show
    @book = Book.find(params[:id])
    @title = @book.title
  end
end
