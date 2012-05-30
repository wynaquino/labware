class AddUserAttributes < ActiveRecord::Migration
  def up
	add_column :users, :status, :string
	add_column :users, :is_private, :boolean, :default => false
	add_column :users, :about, :text, :default => ""
  end

  def down
  end
end
