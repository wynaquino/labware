class AddPostLink < ActiveRecord::Migration
  def up
    add_column :posts, :link, :string
  end

  def down
  end
end
