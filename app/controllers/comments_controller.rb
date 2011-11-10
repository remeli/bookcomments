class CommentsController < ApplicationController
  before_filter :load_book
  
  def create
    @comment = @book.comments.new(params[:comment])
    if @comment.save
      respond_to do |format|
        format.html { redirect_to @book, :notice => "Комментарий успешно добавлен" }
        format.js
      end
    else
      respond do |format|
        format.html { redirect_to @book, :alert => "Комментарий не добавлен" }
        format.js { render 'fail_create.js.erb' }
      end
    end
  end
  
  def plus
    @comments = @book.comments.plustype
    respond_to do |format|
      format.html
      format.js
    end
  end
  
  def minus
    @comments = @book.comments.minustype
    respond_to do |format|
      format.html
      format.js
    end
  end
  
  def neitral
    @comments = @book.comments.neitraltype
    respond_to do |format|
      format.html
      format.js
    end
  end
  
  private
    def load_book
      @book = Book.find_by_title(params[:book_id])
    end
end
