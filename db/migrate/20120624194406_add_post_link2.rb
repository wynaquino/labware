class AddPostLink2 < ActiveRecord::Migration
  def up
    remove_column :posts, :link
    add_column :posts, :link, :string, :default => ""
    
    
    
  end

  def down
  end
end
