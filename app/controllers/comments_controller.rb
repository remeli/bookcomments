class CommentsController < ApplicationController
  before_filter :load_book
  
  def create
    @comment = @book.comment.new(params[:comment])
    if @comment.save
      redirect_to @comment, :notice => "Комментарий успешно добавлен"
    else
      redirect_to @comemnt, :alert => "Комментарий не добавлен"
    end
  end
  
  private
    def load_book
      @book = Book.find(params[:book_id])
    end
end
