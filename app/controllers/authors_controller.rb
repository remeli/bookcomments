class AuthorsController < ApplicationController
  def index
    @title = "Книги"
    @authors = Author.page(params[:page]).per(10)
  end
  
  def show
    @author = Author.find(params[:id])
    @title = "Книги / " + @author.name
    @description = @author.description
  end
end
