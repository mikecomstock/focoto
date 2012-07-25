class RenameFromColumn < ActiveRecord::Migration
  def up
    rename_column :posts, :from, :from_name
  end

  def down
    rename_column :posts, :from_name, :from
  end
end
