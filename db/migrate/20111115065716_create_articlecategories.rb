class CreateArticlecategories < ActiveRecord::Migration
  def change
    create_table :articlecategories do |t|
      t.string :title
      t.string :permalink
      t.timestamps
    end
  end
end
