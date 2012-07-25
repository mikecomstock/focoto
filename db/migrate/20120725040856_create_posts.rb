class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :to_email
      t.string :from
      t.string :from_email
      t.string :text_body
      t.string :html_body
      t.string :headers

      t.timestamps
    end
  end
end
