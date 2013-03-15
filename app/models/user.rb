class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  acts_as_voter
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


  attr_accessible :avatar
  has_attached_file :avatar, :styles => {:med => "200x200>", :thumb => "25x25>" }


  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :username, :about, :avatar
  has_many :groups
  has_many :subscriptions#, :through => :groups,  :source => :user
  #has_many :groups, :through => :subscription
  
  
  
  has_many :posts
  has_many :comments
  has_many :assets
  
  
  
  
  
end
