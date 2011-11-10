class Comment < ActiveRecord::Base
  
  # associations:
  belongs_to :book
  
  # todo: сделать положительный отзыв или отрицательный
end
