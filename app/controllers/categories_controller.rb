# encoding: utf-8
class CategoriesController < ApplicationController
  
  def index
    @title = "Список жанров"
    @description = "Список жанров книг"
    render :layout => 'categoryindex'
  end
  
  def show
    @category = Category.find_by_permalink(params[:id])
    @title = @category.title
    @description = @category.description
    @cat_books = @category.books.page(params[:page]).per(7)
    if @cat_books.size == 0
      redirect_to root_path, :notice => "Книг по данному жанру - нет"
    end
  end
  
end

