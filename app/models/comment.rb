# encoding: utf-8
class Comment < ActiveRecord::Base
  
  # associations:
  belongs_to :book, :counter_cache => true
  
  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  
  #validates
  validates :name, :presence => true,
                   :length => { :maximum => 50 }
  validates :email, :presence => true,
                    :format => { :with => email_regex }
  validates :body, :presence => true
  validates :plusminus, :presence => true,
                        :inclusion => { :in => 0..2 }
                        # 0 => neitral
                        # 1 => plus
                        # 2 => minus
  
                        
  # scope:
  default_scope order("created_at ASC")
  scope :neitraltype, where(:plusminus => 0)
  scope :plustype, where(:plusminus => 1)
  scope :minustype, where(:plusminus => 2)
  
end
