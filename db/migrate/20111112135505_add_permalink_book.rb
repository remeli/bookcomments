class AddPermalinkBook < ActiveRecord::Migration
  def change
    add_column :books, :permalink, :string
  end
end