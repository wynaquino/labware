class Addid2post < ActiveRecord::Migration
  def up
    add_column :posts, :post_uuid, :string
  end

  def down
  end
end
