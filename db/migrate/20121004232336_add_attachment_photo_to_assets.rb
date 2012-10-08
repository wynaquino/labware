class AddAttachmentPhotoToAssets < ActiveRecord::Migration
  def self.up
    change_table :assets do |t|
      t.has_attached_file :photo
      t.string :title, :default => ""
    end
  end

  def self.down
    drop_attached_file :assets, :photo
  end
end
