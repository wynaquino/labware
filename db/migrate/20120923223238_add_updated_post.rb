class AddUpdatedPost < ActiveRecord::Migration
  def up
    add_column :posts, :post_updated_at, :datetime    
  end

  def down
  end
end
