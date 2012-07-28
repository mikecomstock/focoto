class AddEmailToBoard < ActiveRecord::Migration
  def change
    add_column :boards, :email, :string
  end
end
