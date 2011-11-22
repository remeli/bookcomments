# encoding: utf-8
# todo: не работает закрытие алертов
class ApplicationController < ActionController::Base
  protect_from_forgery
  
  before_filter :load_categories, :load_child_categories
  before_filter :load_articlecategories
  # before_filter :load_random_ten_authors
  def load_categories
    @mains_categories = Category.mains
  end
  
  def load_child_categories
    @child_categories = Category.childrens.order("title ASC")
  end
  
  # def load_random_ten_authors
  #   rand_count = 0
  #   while rand_count == 0
  #     rand_count = rand(Author.count-10)
  #   end
  #   @rand_authors = Author.limit(10).offset(rand_count)
  # end
  
  def load_articlecategories
    @myarticlecategories = Articlecategory.all
  end
  
end
