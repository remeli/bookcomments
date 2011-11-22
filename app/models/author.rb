# encoding: utf-8
class Author < ActiveRecord::Base
  has_many :books, :dependent => :nullify
  
  validates :name, :presence => true,
                   :uniqueness => true
  
  default_scope order("name ASC")
  
  has_attached_file :photo, :styles => {:medium => "200x275>", :thumb => "125x170>" },
      :url => "/system/:attachment/:id/:style/:basename.:extension",
      :path => ":rails_root/public/system/:attachment/:id/:style/:basename.:extension",
      :default_url => "/assets/missing.jpg"
  validates_attachment_size :photo, :less_than => 5.megabytes
  validates_attachment_content_type :photo, :content_type => ['image/jpeg', 'image/png', 'image/gif']

  # random
  def self.random
    find(:all).sample(10)
  end

  after_save :updatebooks
  after_update :updatebooks
  
  private
  
    def updatebooks
      @books = Book.where(:authorname => name)
      for book in @books do
        if book.author_id == nil
          book.update_attributes(:author_id => id)
        end
      end
    end
end
