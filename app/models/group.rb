class Group < ActiveRecord::Base
    acts_as_url :name
  
    attr_accessible :about, :name, :is_private, :created_at, :updated_at, :user_id, :frontpage
    
    validates :name, :presence => true, :uniqueness => true, :length => {:within => 3..50 }
    
    validates_format_of :name, :with => /^[a-zA-Z\d\s:]*$/i,:message =>
     "- please use only letters and numbers"
    
    
    validates :about, :presence => true
      
    
    belongs_to :user
    has_many :posts, :order => 'updated_at DESC', :dependent => :destroy
    
    #accepts_nested_attributes_for :posts
    
    def to_param
      url # or whatever you set :url_attribute to
    end
    
    
end
