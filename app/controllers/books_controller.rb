class BooksController < ApplicationController
  
  def index
    @title = "Книги"
    @books = Book.all
  end
  
  def show
    @book = Book.find(params[:id])
    @title = "Книги / " + @book.title
    @description = @book.description
  end
end
