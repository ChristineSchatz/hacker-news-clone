class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title, null: false
      t.string :body, null: false
      t.integer :votes, default: 0
      t.integer :user_id, null: false

      t.timestamps null: false
    end
  end
end
