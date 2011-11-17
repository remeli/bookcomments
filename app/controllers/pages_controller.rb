class PagesController < ApplicationController
  def index
    @title = "Главная"
    @tenbooks = Book.reorder("created_at DESC").limit(10)
    @alphabet = [
"0-9","А","Б","В","Г","Д","Е","Ж","З","И","Й","К","М","Н","О","П","Р","С","Т","У","Ф","Х","Ц","Ч","Ш","Щ","Э","Ю","Я"
    ]
  end

  def about
    @title = "О нас"
  end
  
  def contacts
    @title = "Контакты"
  end
  
  def agreement
    @title = "Пользовательское соглашение"
  end
end
