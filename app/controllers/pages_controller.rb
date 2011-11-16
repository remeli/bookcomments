class PagesController < ApplicationController
  def index
    @title = "Главная"
    @tenbooks = Book.reorder("created_at DESC").limit(10)
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
