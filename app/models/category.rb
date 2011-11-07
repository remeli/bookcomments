class Category < ActiveRecord::Base
  
  acts_as_tree :order => "title"
  
  # validates:
  validates :title, :presence => true
  validates :permalink, :presence => true
  
  # scopes:
  default_scope order("title ASC")
end
