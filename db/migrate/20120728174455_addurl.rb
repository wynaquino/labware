class Addurl < ActiveRecord::Migration
  def up
    add_column :groups, :url, :string
    
  end

  def down
  end
end
