class AddVoteCountComments < ActiveRecord::Migration
  def up
    remove_column :votes, :vote_count
    add_column :comments, :vote_count, :integer, :default => '0'
    
    
  end

  def down
  end
end
