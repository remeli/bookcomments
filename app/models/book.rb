class Book < ActiveRecord::Base  

  attr_accessor :permalink

  #associations:
  has_many :comments, :dependent => :destroy
  belongs_to :category
  
  #validates:
  validates :title, :presence => true,
                    :uniqueness => true
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

  
  # model methods
   after_validation :change_permalink
   
   # todo: activeadmin не делает after_validation
   
   private
   
    def change_permalink
      self.permalink = operation_with_title(title)
    end
    
    def operation_with_title(string)
      title = string
      title.delete!(".,?!()@#\$&*^%-+=/[]{}<>`~''\"")
      new_string = []
      title.each_char do |c|
        if translit.key? c
          new_string << translit[c]
        else
          new_string << c
        end
      end
      new_string.to_s.downcase
    end
    
    def translit
      {
        "а" => "a", "б" => "b", "в" => "v",
        "г" => "g", "д" => "d", "е" => "e",
        "ё" => "jo", "ж" => "zh", "з" => "z",
        "и" => "i", "й" => "ij", "к" => "k",
        "л" => "l", "м" => "m", "н" => "n",
        "о" => "o", "п" => "p", "р" => "r",
        "с" => "s", "т" => "t", "у" => "u",
        "ф" => "f", "х" => "h", "ц" => "c",
        "ч" => "ch", "ш" => "sh", "щ" => "xh",
        "ь" => "", "ы" => "y", "ъ" => "",
        "э" => "je", "ю" => "ju", "я" => "ja",
        " " => "_"
      }
    end
end
