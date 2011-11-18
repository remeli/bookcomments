# encoding: utf-8
class ArticlecategoriesController < ApplicationController
  
  def show
    @articlecategory = Articlecategory.find_by_permalink(params[:id])
    @articles = @articlecategory.articles.page(params[:page]).per(7)
    @title = @articlecategory.title
  end
end
