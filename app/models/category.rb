# encoding: utf-8
class Category < ActiveRecord::Base
  
  # associations:
  has_many :books, :dependent => :nullify
  
  acts_as_tree :order => "title"
  
  # validates:
  validates :title, :presence => true
  validates :permalink, :presence => true
  validates :permalink, :uniqueness => true
  
  # scopes:
  default_scope order("title ASC")
  scope :mains, where("parent_id IS NULL")
  scope :childrens, where("parent_id IS NOT NULL")
  
  # params:
  def to_param
    permalink
  end
  # to_param не работает
end