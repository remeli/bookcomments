# encoding: utf-8
# todo: не работает закрытие алертов
class ApplicationController < ActionController::Base
  protect_from_forgery
  
  before_filter :load_categories, :load_child_categories
  before_filter :load_articlecategories
  before_filter :load_random_ten_authors
  def load_categories
    @mains_categories = Category.mains
  end
  
  def load_child_categories
    @child_categories = Category.childrens.order("title ASC")
  end
  
  def load_random_ten_authors
    @rand_authors = Author.random
  end
  
  def load_articlecategories
    @myarticlecategories = Articlecategory.all
  end
  
end
