# encoding: utf-8
ActiveAdmin.register Comment, :as => "Com" do
  menu :priority => 6, :label => "Комментарии"
  
  index do
    column :id
    column :name
    column :email
    column :created_at
    column :updated_at
    default_actions
  end
  
end
