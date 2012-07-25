class AddSubjectColumn < ActiveRecord::Migration
  def up
    add_column :posts, :subject, :string
  end

  def down
    remove_column :posts, :subject, :string
  end
end
