# encoding: utf-8
class ArticlesController < ApplicationController

  def index
    redirect_to root_path
  end
  
  def show
    @article = Article.find(params[:id])
    @title = "#{@article.articlecategory.title} / #{@article.title}"
  end
  
end
