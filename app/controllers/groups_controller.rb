class GroupsController < ApplicationController
  # GET /groups
  # GET /groups.json

  #layout "devise"
  before_filter :authenticate_user!, :except => [:index, :show]
  around_filter :catch_not_found, :except => [:index, :new]
  
  def index
    @groups = Group.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @groups }
    end
  end




  # GET /groups/1
  # GET /groups/1.json
  def show
    @group = Group.find_by_url(params[:id])
    
   if user_signed_in?
      if @group.is_private == true and current_user.id == @group.user_id
        return
      end
      
      if @group.is_private == true and current_user.id != @group.user_id
        render "show_noaccess"
      end
    end

    if !user_signed_in?
      if @group.is_private == false
      
      end
      
      if @group.is_private == true 
        render "show_noaccess"
      end
    end


        
  end

  # GET /groups/new
  # GET /groups/new.json
  def new
    @group = Group.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @group }
    end
  end

  # GET /groups/1/edit
  def edit
    #@group = Group.find(params[:id])
    @group = current_user.groups.find(params[:id])
 
    end

  # POST /groups
  # POST /groups.json
  def create
    #@group = Group.new(params[:group])

    @group = current_user.groups.build(params[:group])


    respond_to do |format|
      if @group.save
        format.html { redirect_to user_path(current_user), notice: 'Group was successfully created.' }
        format.json { render json: @group, status: :created, location: @group }
      else
        format.html { render action: "new" }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /groups/1
  # PUT /groups/1.json
  def update
    #@group = Group.find(params[:id])
    @group = current_user.groups.find(params[:id])

    respond_to do |format|
      if @group.update_attributes(params[:group])
        #format.html { redirect_to @group, notice: 'Group was successfully updated.' }
        format.html { redirect_to group_path(@group), notice: 'Group was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
    
  end

  # DELETE /groups/1
  # DELETE /groups/1.json
  def destroy
    #@group = Group.find(params[:id])
    @group = current_user.groups.find(params[:id])
    @group.destroy

    respond_to do |format|
      #format.html { redirect_to groups_url }
      format.html { redirect_to user_path(current_user), notice: 'Group was successfully removed.' }
      format.json { head :no_content }
    end
  end
  
  private

  def catch_not_found
      yield 
    rescue ActiveRecord::RecordNotFound 
      redirect_to user_path(current_user), :flash => { :notice => "Record not found." }
  end

  
  
end
