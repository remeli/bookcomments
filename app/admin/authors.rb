ActiveAdmin.register Author do
  menu :priority => 3, :label => "Авторы"
  index do
    column :id
    column :name
    default_actions
  end
  
  form do |f|
    f.inputs "Детали" do
      f.input :name, :label => "Имя:"
      f.input :photo, :as => :file, :label => "Фотография:"
      f.input :description, :label => "Описание:"
    end
    f.buttons
  end
end
