class BooksController < ApplicationController
  
  def index
    @title = "Книги"
    @books = Book.page(params[:page]).per(10)
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
  
  def alphabet
    alphasym = params[:alphasym]
    if alphasym == "1"
      conditions = "SELECT * FROM books WHERE title REGEXP '^[0-9]'"
      @books = Book.find_by_sql(conditions)
    else
      @books = Book.all(:conditions => ['substr(title,1,1) = ?', alphasym])
    end
    @books = Kaminari.paginate_array(@books).page(params[:page]).per(10)
    
    unless @books.size > 0
      redirect_to root_path, :alert => "К сожалению, мы ничего не нашли"
    else
      render('index')  
    end
  end
  
  def topcomments
    @books = Book.reorder("comments_count DESC").limit(20)
  end
  
end