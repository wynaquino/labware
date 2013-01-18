class Post < ActiveRecord::Base
  before_validation :set_permanent_uuid, :on => :create
  
  validates_uniqueness_of :post_uuid
  
  
  acts_as_commentable
      attr_accessible :title, :content, :is_private, :is_draft, :is_locked, :is_sticky, :user_id, :group_id, :created_at, :updated_at, :link, :post_uuid
  
  validates :title, :presence => true, :length => {:within => 3..70 }
  #validates :content, :presence => true
  validates :link, :format => URI::regexp(%w(http https)), :allow_blank => true

  
  
  
  
  #default_scope :order => "posts.created_at DESC"  
  
  belongs_to :user
  belongs_to :group
 
 
  def to_param
    "#{post_uuid}"
  end
  protected

  def set_permanent_uuid
    # If you want to a shorter UUID you can play with other options than Time 
    self.post_uuid = Base32::Crockford.encode(Time.now.to_i)
  end

  
  # attr_accessible :title, :body
end
