class Addfrontpg < ActiveRecord::Migration
  def up
    
    remove_column :groups, :frontpage
    add_column :groups, :frontpage, :boolean, :default => false
  end

  def down
  end
end
