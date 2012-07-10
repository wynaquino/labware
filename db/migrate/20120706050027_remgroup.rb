class Remgroup < ActiveRecord::Migration
  def up
    remove_column :groups, :is_private
    add_column :groups, :is_private, :boolean, :default => false
  end

  def down
  end
end
