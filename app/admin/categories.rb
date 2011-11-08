ActiveAdmin.register Category do
  before_filter do
    Category.class_eval do
      def to_param
        id.to_s
      end
    end
  end
  
  menu :priority => 1, :label => "Категории"
  
  # index page:
  index do
    column :id
    column "Название", :title
    column "Прямая ссылка", :permalink
    column "Тип категории:" do |category|
      if category.parent
        div :class => "children" do
          "подкатегория"
        end
      else
        div :class => "parent" do
          "главная категория"
        end
      end
    end
    default_actions
  end
  
  # form:
  form do |f|
    f.inputs "Детали" do
      f.inputs "Родительская категория:" do
        f.collection_select :parent_id, Category.mains(:order => "title"), :id, :title, :include_blank => true
      end
      f.input :title, :label => "Название:"
      f.input :permalink, :label => "Прямая ссылка:"
      f.input :description, :label => "Описание:"
      f.buttons    
    end
  end
  
end
