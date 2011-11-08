class Category < ActiveRecord::Base
  
  acts_as_tree :order => "title"
  
  # validates:
  validates :title, :presence => true
  validates :permalink, :presence => true
  validates :permalink, :uniqueness => true
  
  # scopes:
  default_scope order("title ASC")
  scope :mains, where("parent_id IS NULL")
  scope :childrens, where("parent_id IS NOT NULL")
  
  def to_param
    permalink
  end
end