class GroupsController < ApplicationController
  helper :all

  #layout "devise"
  before_filter :authenticate_user!, :except => [:index, :show]
  before_filter :group_access, :only => [:show]
  around_filter :catch_not_found, :except => [:index, :new]
  
  def show
    @group = Group.find_by_url(params[:id])
    @posts = @group.posts.order("created_at DESC")
  end




  def new
    @group = Group.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @group }
    end
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
        format.json { render json: @group, status: :created, location: @group }
      else
        format.html { render action: "new" }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @group = current_user.groups.find_by_url(params[:id])

    respond_to do |format|
      if @group.update_attributes(params[:group])
        #format.html { redirect_to @group, notice: 'Group was successfully updated.' }
        format.html { redirect_to user_path(current_user.username), notice: 'Group was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @group.errors, status: :unprocessable_entity }
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
