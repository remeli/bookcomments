class CategoriesController < ApplicationController
  
  def show
    # base:
    @category = Category.find_by_permalink(params[:id])
    @title = @category.title
    @description = @category.description
    @cat_books = @category.books.page(params[:page]).per(3)
  end
  
end
