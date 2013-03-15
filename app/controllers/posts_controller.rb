class PostsController < ApplicationController
  
  before_filter :authenticate_user!, :except => [:show, :latest_comments, :oldest_comments, :highest_voted_comments]
  before_filter :check_view_access, :only => [:show]
  
  def show
    @post = Post.find_by_post_uuid(params[:id])  
    @group = Group.find_by_url(params[:group_id])
    @comments = @post.root_comments.order("created_at ASC")
  end

  def new
    @post = Post.new
    @group = Group.find_by_url(params[:group_id])
   
  end

  # GET /posts/1/edit
  def edit
    @post = current_user.posts.find_by_post_uuid(params[:id])
  end

  def create
    @group = Group.find_by_url(params[:group_id])
    @post = @group.posts.build(params[:post])
    @post.user_id = current_user.id

    respond_to do |format|
      if @post.save
        format.html { redirect_to group_path(@group), notice: 'Post was successfully created.' }
      else
        format.html { render action: "new" }
      end
    end
  end

  # PUT /posts/1
  # PUT /posts/1.json
  def update
    @post = current_user.posts.find_by_post_uuid(params[:id])

    respond_to do |format|
      if @post.update_attributes(params[:post])
        format.html { redirect_to group_post_path(@post.group, @post), notice: 'Post was successfully updated.' }
      else
        format.html { render action: "edit" }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post = current_user.posts.find_by_post_uuid(params[:id])
    @post.destroy

    respond_to do |format|
      format.html { redirect_to group_path(@post.group) }
    end
  end
  
  

  
  
end
