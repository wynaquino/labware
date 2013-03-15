class AddVoteCount < ActiveRecord::Migration
  def up
    add_column :votes, :vote_count, :integer, :default => '0'
  end

  def down
  end
end
