class SearchController < ApplicationController
  
  def index
    if params[:keyword].blank?
      redirect_to(books_path, :alert => "Ничего не найдено")
    else
      word = '%'+params[:keyword]+'%'
      text_conditions = "SELECT * FROM books WHERE (title like ? or description like ? or authorname like ?)"
      conditions = [text_conditions, word, word, word]
      @books = Book.find_by_sql(conditions)
      unless @books.size > 0
        redirect_to(books_path, :alert => "Ничего не найдено")
      end
    end
  end
  # сделать notice, alert и выбор по топикам!
end
