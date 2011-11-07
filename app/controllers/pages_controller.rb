class PagesController < ApplicationController
  def index
    @title = "Главная"
  end
  
  def about
    @title = "О нас"
  end
  
  def contacts
    @title = "Контакты"
  end
  
  def license
    @title = "Лицензионное соглашение"
  end
end
