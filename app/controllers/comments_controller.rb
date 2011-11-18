# encoding: utf-8
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
        format.js
      end
    end
  end
  
  private
    def load_book
      @book = Book.find(params[:book_id])
    end
end


