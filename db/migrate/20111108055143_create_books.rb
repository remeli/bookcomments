class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :title
      t.text :description
      t.string :isbn
      t.date :year
      t.string :authorname
      t.references :category
      t.timestamps
    end
  end
end
