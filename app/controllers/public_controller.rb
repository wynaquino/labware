class PublicController < ApplicationController
  def index
    
    @title = 'Welcome!'
    #@posts = Post.find(:all, :order => "created_at DESC", :limit => 10)
    @posts = Post.all :joins => :group, :conditions => {:groups => {:frontpage => true}}
  end

  def about
    @title = 'About'
  end

  def contact
    @title = 'Contact'
  end

  def privacy
    @title = 'Privacy'
  end
end
