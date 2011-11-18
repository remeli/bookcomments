# encoding: utf-8
class PagesController < ApplicationController
  def index
    @title = "Главная"
    @tenbooks = Book.reorder("created_at DESC").limit(10)
    rand_count = 0
    while rand_count == 0
      rand_count = rand(Book.count-10)
    end
    @randbooks = Book.limit(10).offset(rand_count)
    @alphabet = {   
      "0-9" => "1",
      "А" => "А",
      "Б" => "Б",
      "В" => "В",
      "Г" => "Г",
      "Д" => "Д",
      "Е" => "Е",
      "Ж" => "Ж",
      "З" => "З",
      "И" => "И",
      "Й" => "Й",
      "К" => "К",
      "М" => "М",
      "Н" => "Н",
      "О" => "О",
      "П" => "П",
      "Р" => "Р",
      "С" => "С",
      "Т" => "Т",
      "У" => "У",
      "Ф" => "Ф",
      "Х" => "Х",
      "Ц" => "Ц",
      "Ч" => "Ч",
      "Ш" => "Ш",
      "Щ" => "Щ",
      "Э" => "Э",
      "Ю" => "Ю",
      "Я" => "Я"
    }.sort
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


