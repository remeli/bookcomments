module ApplicationHelper
  
  def site
    {
      :url => "http://knigalico.ru",
      :title => "Отзывы о книгах. Описание книг, авторов, жанры",
      :description => "Современная литература, отзывы о книгах, лучшие книги, классическая литература, советы по книгам, что почитать из фантастики",
      :keys => "книги, отзывы, литература, отзывы, маяковский, достоевский, пушкин, рейтинг книг, иностранная литература, что почитать"
    }
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
      base_description + ", " + @description
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
  
end
