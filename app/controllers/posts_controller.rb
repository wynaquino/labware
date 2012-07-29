class PostsController < ApplicationController
  
  before_filter :authenticate_user!, :except => [:show]
  before_filter :check_view_access, :only => [:show]
  
  
  # GET /posts/1
  # GET /posts/1.json

  
  def show
    @post = Post.find(params[:id])
    @group = Group.find_by_url(params[:group_id])
    
   # @group = Group.find(@post.group_id)
    
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @post }
    end
  end

  # GET /posts/new
  # GET /posts/new.json
  def new
    @post = Post.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @post }
    end
  end

  # GET /posts/1/edit
  def edit
    @post = current_user.posts.find(params[:id])
  end

  # POST /posts
  # POST /posts.json
  def create
    @group = Group.find(params[:group_id])
    @post = @group.posts.build(params[:post])
    @post.user_id = current_user.id

    #look into this.
    
    respond_to do |format|
      if @post.save
        format.html { redirect_to group_path(@group), notice: 'Post was successfully created.' }
        format.json { render json: @post, status: :created, location: @post }
      else
        format.html { render action: "new" }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /posts/1
  # PUT /posts/1.json
  def update
    @post = current_user.posts.find(params[:id])

    respond_to do |format|
      if @post.update_attributes(params[:post])
        format.html { redirect_to group_path(@post.group), notice: 'Post was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post = current_user.posts.find(params[:id])
    @post.destroy

    respond_to do |format|
      format.html { redirect_to group_path(@post.group) }
      format.json { head :no_content }
    end
  end
end
