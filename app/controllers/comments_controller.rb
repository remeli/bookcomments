class CommentsController < ApplicationController
  before_filter :load_book
  
  def create
    @comment = @book.comments.new(params[:comment])
    if @comment.save
      redirect_to @book, :notice => "Комментарий успешно добавлен"
    else
      redirect_to @book, :alert => "Комментарий не добавлен"
    end
  end
  
  private
    def load_book
      @book = Book.find_by_title(params[:book_id])
    end
end
