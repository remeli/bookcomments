class BooksController < ApplicationController
  
  def index
    @title = "Книги"
    @books = Book.all
  end
  
  def show
    @book = Book.find(params[:id])
    @title = "Книги / " + @book.title
    @description = @book.description
    @comments = @book.comments
  end
  
  def plus
    @book = Book.find(params[:id])
    @comments = Comment.plustype.where(:book_id => @book.id)
    render('show')
  end
  
  def minus
    @book = Book.find(params[:id])
    @comments = Comment.minustype.where(:book_id => @book.id)
    render('show')
  end
  
  def neitral
    @book = Book.find(params[:id])
    @comments = Comment.neitraltype.where(:book_id => @book.id)
    render('show')
  end
end
