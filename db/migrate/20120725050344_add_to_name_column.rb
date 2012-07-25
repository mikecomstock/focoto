class AddToNameColumn < ActiveRecord::Migration
  def up
    add_column :posts, :to_name, :string
  end

  def down
    remove_column :posts, :to_name
  end
end
