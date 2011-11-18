class CategoriesController < ApplicationController
  
  def index
    @title = "Список жанров"
    @description = "Список жанров книг"
    render :layout => 'categoryindex'
  end
  
  def show
    # base:
    @category = Category.find_by_permalink(params[:id])
    @title = @category.title
    @description = @category.description
    @cat_books = @category.books.page(params[:page]).per(7)
  end
  
end

