class Group < ActiveRecord::Base
    attr_accessible :about, :name, :is_private, :created_at, :updated_at, :user_id
    belongs_to :user
    validates_uniqueness_of :name
end
