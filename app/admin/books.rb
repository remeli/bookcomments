ActiveAdmin.register Book do
  menu :priority => 2, :label => "Книги"
  index do
    column :id
    column :title
    column :category
    column :authorname
    default_actions
  end
  form do |f|
    f.inputs "Детали" do
      f.inputs "Категории" do
        f.collection_select :category_id, Category.childrens(:order => "title"), :id, :title
      end
      f.input :title, :label => "Название"
      f.input :authorname, :label => "Имя автора:"
      f.input :year, :as => :date,:start_year => Date.today.year-90, :end_year => Date.today.year+6, :discard_month => true, :discard_day => true, :label => "Год выпуска:"
      f.input :cover, :as => :file, :label => "Фотография"
      f.input :isbn, :label => "ISBN:"
      f.input :description, :label => "Описание:"
    end
    f.buttons
  end
  
end