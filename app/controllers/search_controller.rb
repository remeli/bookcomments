class SearchController < ApplicationController
  
  def index
    @title = "Поиск"
    if params[:keyword].blank?
      redirect_to(root_path, :alert => "Ничего не найдено")
    else      
      word = '%'+params[:keyword]+'%'
      topic = params[:topic]
      if topic == "books"
        
        text_conditions = "SELECT * FROM books WHERE (title like ? or authorname like ?)"
        conditions = [text_conditions, word, word]
        @books = Book.find_by_sql(conditions)
        result(@books, "books")
      elsif topic == "authors"
        text_conditions = "SELECT * FROM authors WHERE (name like ?)"
        conditions = [text_conditions, word]
        @authors = Author.find_by_sql(conditions)
        result(@authors, "authors")
        
      elsif topic == "articles"
        text_conditions = "SELECT * FROM articles WHERE (title like ? or body like ?)"
        conditions = [text_conditions, word, word]
        @articles = Article.find_by_sql(conditions)
        result(@articles, "articles")
      else
        redirect_to(root_path, :alert => "Ничего не найдено")
      end      
    end
  end
  
  def result(object, params)
    unless object.size > 0
      redirect_to(root_path, :alert => "Ничего не найдено")
    else
      render :file => "/search/#{params}"
    end
  end
  
end
# todo: сделать kaminari, доделть articles view, добавить в книгах h1 и тд