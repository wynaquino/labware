class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.string :name, :null => false, :default => ""
      t.text   :about, :null => false, :default => ""
      t.integer :user_id, :null => false
      t.string   :is_private, :default => "no" 
      t.datetime :created_at
      t.datetime :updated_at
      t.timestamps
    end
  end
end
