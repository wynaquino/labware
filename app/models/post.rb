class Post < ActiveRecord::Base
      attr_accessible :title, :content, :is_private, :is_draft, :is_locked, :is_sticky, :user_id, :group_id, :created_at, :updated_at, :link
  
  validates :title, :presence => true, :length => {:within => 3..70 }
  validates :content, :presence => true
  validates :link, :format => URI::regexp(%w(http https)), :allow_blank => true

  
  
  
  
  default_scope :order => "posts.created_at DESC"  
  
  belongs_to :user
  belongs_to :group
  
  
  # attr_accessible :title, :body
end
