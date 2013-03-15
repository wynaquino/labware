class AddVoteCountPosts < ActiveRecord::Migration
  def up
    add_column :posts, :vote_count, :integer, :default => '0'
    
  end

  def down
  end
end
