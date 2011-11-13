class ApplicationController < ActionController::Base
  protect_from_forgery
  
  before_filter :load_categories, :load_child_categories
  
  def load_categories
    @mains_categories = Category.mains
  end
  
  def load_child_categories
    @child_categories = Category.childrens.order("title ASC")
  end
  
end
