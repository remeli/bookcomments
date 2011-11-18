# encoding: utf-8
ActiveAdmin.register Article do
  
  menu :priority => 5, :label => "Статьи"
  
  index do
    column :id
    column :title
    column :articlecategory
    default_actions
  end
  
 form do | f |
    f.inputs "Детали" do
      f.inputs "Рубрика:" do
        f.collection_select :articlecategory_id, Articlecategory.all(:order => "title"), :id, :title
      end
      f.input :title, :label => "Название"
      f.input :body, :label => "Текст:", :input_html => {:class => 'editor'}
    end
    f.buttons
  end
end
