class ArchiveController < ApplicationController
  def index
    @years = (1800..Date.today.year+4)
  end
  
  def show
    word = '%'+params[:year]+'%'
    text_conditions = "SELECT * FROM books WHERE year like ?"
    conditions = [text_conditions, word]
    @books = Book.find_by_sql(conditions)
    @books = Kaminari.paginate_array(@books).page(params[:page]).per(5)
    if @books.size == 0
      redirect_to archive_path, :alert => "Книг за этот год у нас нет :("
    end
  end
end
