class Group < ActiveRecord::Base
    acts_as_url :name
  
    has_attached_file :avatar, :styles => {:med => "300x300>", :thumb => "30x30>", :fmed => "125x125>" }
  
  
    attr_accessible :about, :name, :is_private, :created_at, :updated_at, :user_id, :frontpage, :avatar #,  #, #:url, :avatar_file_name, :avatar_content_type, :avatar_file_size, :avatar_updated_at(1i), :avatar_updated_at, :avatar_updated_at, :avatar_updated_at, :avatar_updated_at, :as => [:default, :admin] #, :admin
    


    
    
    
    validates :name, :presence => true, :uniqueness => true, :length => {:within => 3..50 }
    
    validates_format_of :name, :with => /^[a-zA-Z\d\s:]*$/i,:message =>
     "- please use only letters and numbers"
    
    
    validates :about, :presence => true
      
    
    belongs_to :user
    #belongs_to :subscription
    
    has_many :posts, :dependent => :destroy
    #has_many :users, :through => :subscriptions
    has_many :subscriptions
    #accepts_nested_attributes_for :posts
    
    def to_param
      url # or whatever you set :url_attribute to
    end
    
    
end
