class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.text :content
      t.references :user
      t.references :match

      t.timestamps
    end
    add_index :posts, :user_id
    add_index :posts, :match_id
  end
end
