class ChangeColumnsToText < ActiveRecord::Migration
  def up
    change_column :posts, :text_body, :text
    change_column :posts, :html_body, :text
    change_column :posts, :headers, :text
  end

  def down
    change_column :posts, :text_body, :string
    change_column :posts, :html_body, :string
    change_column :posts, :headers, :string
  end
end
