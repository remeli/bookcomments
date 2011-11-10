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
  validates :plusminus, :presence => true,
                        :inclusion => { :in => 0..2 }
                        # 0 => netral
                        # 1 => plus
                        # 2 => minus
  
                        
  # todo: сделать положительный отзыв или отрицательный
  # валидацию, js
end
