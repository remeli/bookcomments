class Articlecategory < ActiveRecord::Base
  
  has_many :articles
  validates :title, :permalink, :presence => true
  
  default_scope order("id ASC")
  
  def to_param
    permalink
  end
end
