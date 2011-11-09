class Comment < ActiveRecord::Base
  
  # associations:
  belongs_to :book
end
