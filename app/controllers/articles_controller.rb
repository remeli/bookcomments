class ArticlesController < ApplicationController
  
  def show
    @article = Article.find(params[:id])
    @title = "#{@article.articlecategory} / #{@article.title}"
  end
  
end
