class ArticlecategoriesController < ApplicationController
  def show
    @articlecategory = Article.find_by_permalink(params[:id])
  end
end
