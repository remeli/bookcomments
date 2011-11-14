class Author < ActiveRecord::Base
  has_many :books, :dependent => :nullify
  
  validates :name, :presence => true
  validates :year_born, :presence => true
  
  default_scope order("name ASC")
  
  has_attached_file :photo, :styles => {:medium => "200x275>", :thumb => "125x170>" },
      :url => "/system/:attachment/:id/:style/:basename.:extension",
      :path => ":rails_root/public/system/:attachment/:id/:style/:basename.:extension"
  validates_attachment_size :photo, :less_than => 5.megabytes
  validates_attachment_content_type :photo, :content_type => ['image/jpeg', 'image/png', 'image/gif']
end
