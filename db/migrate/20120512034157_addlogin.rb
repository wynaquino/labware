class Addlogin < ActiveRecord::Migration
  def up
add_column :users, :username, :string
  end

  def down
  end
end
