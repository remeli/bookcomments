class CreateAuthors < ActiveRecord::Migration
  def change
    create_table :authors do |t|
      t.string :name
      t.date :year_born
      t.date :year_death
      t.text :description
      t.timestamps
    end
  end
end
