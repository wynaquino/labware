class Add < ActiveRecord::Migration
  def up
    add_column :groups, :frontpage, :string, :default => "no"
  end

  def down
  end
end
