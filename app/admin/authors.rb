ActiveAdmin.register Author do
  menu :priority => 3, :label => "Авторы"
  index do
    column :id
    column :name
    columns :year_born
  end
  
  form do |f|
    f.inputs "Детали" do
      f.input :name, :label => "Имя:"
      f.input :year_born, :as => :date,:start_year => Date.today.year-90, :end_year => Date.today.year+6, :discard_month => true, :discard_day => true, :label => "Год рождения:"
      f.input :year_death, :as => :date,:start_year => Date.today.year-90, :end_year => Date.today.year+6, :discard_month => true, :discard_day => true, :label => "Год смерти:"
      f.input :description, :label => "Описание:"
    end
    f.buttons
  end
end
