class AddTypeToComment < ActiveRecord::Migration
  def change
    add_column :comments, :plusminus, :integer, :default => 1
  end
end