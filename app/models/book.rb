class Book < ActiveRecord::Base

  #associations:
  has_many :comments, :dependent => :destroy
  belongs_to :category
  
  #validates:
  validates :title, :presence => true
  validates :year, :presence => true
  validates :authorname, :presence => true
  validates :category_id, :presence => true
  
  
  #scope
  default_scope order("created_at DESC")
  
  #paperclip:
  has_attached_file :cover, :styles => {:medium => "200x275>", :thumb => "125x170>" },
      :url => "/system/:attachment/:id/:style/:basename.:extension",
      :path => ":rails_root/public/system/:attachment/:id/:style/:basename.:extension"
  validates_attachment_size :cover, :less_than => 5.megabytes
  validates_attachment_content_type :cover, :content_type => ['image/jpeg', 'image/png', 'image/gif']

  # params:
  
  def to_param
    title
  end
end
