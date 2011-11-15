class Article < ActiveRecord::Base
  belongs_to :articlecategory
  
  validates :title, :body, :articlecategory_id, :presence => true
  
  default_scope order("created_at ASC")
  
end
