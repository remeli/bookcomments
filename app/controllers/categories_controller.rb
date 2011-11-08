class CategoriesController < ApplicationController
  def show
    @category = Category.find(params[:id])
    @title = @category.title
    @description = @category.description
  end
end
