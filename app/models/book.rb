class Book < ActiveRecord::Base

  #associations:
  belongs_to :category
  
  #validates:
  validates :title, :presence => true
  validates :year, :presence => true
  validates :authorname, :presence => true
  validates :category_id, :presence => true
  
  
  #scope
  default_scope order("created_at ASC")
  
  
end
