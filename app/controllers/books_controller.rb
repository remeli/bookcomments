class BooksController < ApplicationController
  def index
    @title = "Книги"
    @books = Book.all
  end
  
  def show
    @book = Book.find_by_title(params[:id])
    @title = "Книги / " + @book.title
    @description = @book.description
  end
end
