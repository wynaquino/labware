class Asset < ActiveRecord::Base
  belongs_to :user
  validates_attachment_presence :photo
  has_attached_file :photo, :styles => { :thumb_s => "15x15>", :thumb => "160x120", :med => "660x500>"}
  acts_as_commentable
  belongs_to :user
  # attr_accessible :title, :body
end
