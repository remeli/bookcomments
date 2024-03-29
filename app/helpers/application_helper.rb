# encoding: utf-8
module ApplicationHelper
  
  def site
    {
      :url => "http://2litra.ru",
      :www => "www.2litra.ru",
      :official_url => "2LITRA",
      :title => "2LITRA. Отзывы о книгах. Описание книг, авторов, жанры",
      :description => "Современная литература, отзывы о книгах, лучшие книги, классическая литература, советы по книгам, что почитать из фантастики",
      :keys => "книги, отзывы, литература, отзывы, маяковский, достоевский, пушкин, рейтинг книг, иностранная литература, что почитать",
      :current_year => Date.today.year
    }
  end
  
  def isset_authorid?(object)
    unless object.author_id.nil?
      true
    end
  end
  
  def title
    base_title = site[:title]
    if @title
      base_title + " / " + @title
    else
      base_title
    end
  end
  
  def description
    base_description = site[:description]
    if @description
      desc = @description
      if desc.length > 200
        desc = truncate(desc, :length => 200)
      end
    else
      base_description
    end
  end
  
  def keys
    base_keys = site[:keys]
    if @keys
      base_keys + ", " + @keys
    else
      base_keys
    end
  end
  
  def find_all_subcategories(category)
    if category.children.size > 0
      ret = "<ul>"
      category.children.each do |subcat|
       if subcat.children.size > 0
         ret += "<li class='closed'>"
         ret += "<span class='folder'>"
         ret += link_to(subcat.title, subcat, :title => subcat.description)
         ret += "</span>"
         find_all_categories(subcat)
         ret += "</li>"
       else
         ret += "<li>"
         ret += "<span class='notsubcat'>"
         ret += link_to(subcat.title, subcat, :title => subcat.description)
         ret += "</span>"
         ret += "</li>"
       end
      end
      ret += "</ul>"
    end
  end
  
  def find_all_genres(category)
    if category.children.size > 0
      ret = "<ul>"
      category.children.each do |subcat|
       if subcat.children.size > 0
         ret += "<li>"
         ret += "<span>"
         ret += link_to(subcat.title, subcat)
         ret += "</span>"
         find_all_categories(subcat)
         ret += "</li>"
       else
         ret += "<li>"
         ret += "<span>"
         ret += link_to(subcat.title, subcat)
         ret += "</span>"
         ret += "</li>"
       end
      end
      ret += "</ul>"
    end
  end
  
  def isset_subcat?(object)
    if object.children.size > 0
      true
    end
  end
  
  def to_year(object)
    object.year.year
  end
  
  def to_date(object)
    object.created_at.to_date
  end
  
  def type_comment(comment)
    type = comment.plusminus
    case type
      when 0 then "neitral"
      when 1 then "plus"
      when 2 then "minus"
    end
  end
    
  def author_book?(object)
    if object.books.size > 0
      true
    end
  end
  
end
