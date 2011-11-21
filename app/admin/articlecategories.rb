# encoding: utf-8
ActiveAdmin.register Articlecategory do
  # before_filter do
  #   Articlecategory.class_eval do
  #     def to_param
  #       id.to_s
  #     end
  #   end
  # end
  
  around_filter do |controller, action|
    Articlecategory.class_eval do
      def to_param
        id.to_s
      end
    end
    begin
      action.call
    ensure
      Articlecategory.class_eval do
        def to_param
          permalink
        end
      end
    end
  end
  
  menu :priority => 4, :label => "Рубрики статей"
  
  index do
    column :id
    column "Название:", :title
    column "Прямая ссылка:", :permalink
    default_actions
  end
  
  form do |f|
    f.inputs "Детали" do
      f.input :title, :label => "Наименование:"
      f.input :permalink, :label => "Прямая ссылка:"
    end
    f.buttons
  end
end
