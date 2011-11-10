class Comment < ActiveRecord::Base
  
  # associations:
  belongs_to :book
  
  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  
  #validates
  validates :name, :presence => true,
                   :length => { :maximum => 50 }
  validates :email, :presence => true,
                    :format => { :with => email_regex }
  validates :body, :presence => true
  
  # todo: сделать положительный отзыв или отрицательный
  # валидацию, js
end
