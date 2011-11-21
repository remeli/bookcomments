# encoding: utf-8
class Book < ActiveRecord::Base  
  # todo: прикрутить рейтинг
  
  has_many :comments, :dependent => :destroy
  belongs_to :category
  belongs_to :author
  
  validates :title, :presence => true,
                    :uniqueness => true
  validates :year, :presence => true
  validates :authorname, :presence => true
  validates :category_id, :presence => true
  
  
  default_scope order("created_at DESC")
  
  has_attached_file :cover, :styles => {:medium => "200x275>", :thumb => "125x170>" },
      :url => "/system/:attachment/:id/:style/:basename.:extension",
      :path => ":rails_root/public/system/:attachment/:id/:style/:basename.:extension",
      :default_url => "/assets/missing_cover_book.jpg"
  validates_attachment_size :cover, :less_than => 5.megabytes
  validates_attachment_content_type :cover, :content_type => ['image/jpeg', 'image/png', 'image/gif']
  
  
  before_save :upd_author
  before_update :upd_author
  
  private
    
    def upd_author
      self.author_id = search_author(authorname)
    end
    
    def search_author(authorname)
      author = Author.find_by_name(authorname)
      unless author.nil?
        author.id
      else
        nil
      end
    end
  
  
  # before_save :change_permalink
  # before_update :change_permalink
  
  # private
  #  
  #   def change_permalink
  #     self.permalink = operation_with_title(title)
  #   end
  #   
  #   def operation_with_title(string)
  #     mytitle = string.downcase!
  #     mytitle.delete!(".,?!()@#\$&*^%-+=/[]{}<>`~''\"")
  #     new_string = []
  #     mytitle.each_char do |c|
  #       if translit.key? c
  #         new_string << translit[c]
  #       else
  #         new_string << c
  #       end
  #     end
  #     new_string.to_s
  #   end
  #   
  #   def translit
  #     {
  #       "а" => "a", "б" => "b", "в" => "v",
  #       "г" => "g", "д" => "d", "е" => "e",
  #       "ё" => "jo", "ж" => "zh", "з" => "z",
  #       "и" => "i", "й" => "ij", "к" => "k",
  #       "л" => "l", "м" => "m", "н" => "n",
  #       "о" => "o", "п" => "p", "р" => "r",
  #       "с" => "s", "т" => "t", "у" => "u",
  #       "ф" => "f", "х" => "h", "ц" => "c",
  #       "ч" => "ch", "ш" => "sh", "щ" => "xh",
  #       "ь" => "", "ы" => "y", "ъ" => "",
  #       "э" => "je", "ю" => "ju", "я" => "ja",
  #       " " => "_"
  #     }
  #   end
end