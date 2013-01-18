class GroupsController < ApplicationController
  #layout "devise"
  before_filter :authenticate_user!, :except => [:show, :group_posts_latest_comment]
  before_filter :group_access, :only => [:show]
  around_filter :catch_not_found, :except => [:index, :new]
  
  def show
    @group = Group.find_by_url(params[:id])
    @posts = @group.posts.paginate(:page => params[:page], :per_page => 30, :order => "is_sticky DESC, created_at DESC") #.order("is_sticky DESC, created_at DESC")
  end

  def new
    @group = Group.new
  end

  # GET /groups/1/edit
  def edit
    @group = current_user.groups.find_by_url(params[:id])
  end

  def create
    @group = current_user.groups.build(params[:group])
    respond_to do |format|
      if @group.save
        format.html { redirect_to user_path(current_user.username), notice: 'Group was successfully created.' }
      else
        format.html { render action: "new" }
      end
    end
  end

  def update
    @group = current_user.groups.find_by_url(params[:id])

    respond_to do |format|
      if @group.update_attributes(params[:group])
        #format.html { redirect_to @group, notice: 'Group was successfully updated.' }
        format.html { redirect_to user_path(current_user.username), notice: 'Group was successfully updated.' }
      else
        format.html { render action: "edit" }
      end
    end
    
  end

  def destroy
    #@group = Group.find(params[:id])
    @group = current_user.groups.find(params[:id])
    if @group.destroy
      #format.html { redirect_to groups_url }
    redirect_to user_path(current_user.username), notice: 'Group was successfully removed.' 
    else
      redirect_to root_path, :flash => { :notice => "Record not found." }
    end     
  end
  
  private

  def catch_not_found
      yield 
    rescue ActiveRecord::RecordNotFound 
      redirect_to root_path, :flash => { :notice => "Record not found." }
  end

end
