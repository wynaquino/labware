class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title, :null => false, :default => ""
      t.text :content, :null => false, :default => ""
      t.datetime :created_at
      t.datetime :updated_at
      t.integer :group_id, :null => false
      t.integer :user_id, :null => false
      t.boolean  "is_sticky",           :default => false
      t.boolean  "is_locked",           :default => false
      t.boolean  "is_draft",            :default => false
      t.timestamps
    end
    
    add_index :posts, [:user_id]
    add_index :posts, [:group_id]
    
    
  end
end
