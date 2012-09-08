class CommentsController < ApplicationController
  before_filter :authenticate_user!, :except => [:index, :show]
  # GET /comments
  # GET /comments.json
  def index
    @comments = Comment.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @comments }
    end
  end

  # GET /comments/1
  # GET /comments/1.json
  def show
    @comment = Comment.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @comment }
    end
  end

  # GET /comments/new
  # GET /comments/new.json
  def new
    @comment = Comment.new
    @post = Post.find(params[:post_id])

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @comment }
    end
  end
  


  # GET /comments/1/edit
  def edit
    @post = Post.find(params[:post_id])
    @comment = Comment.find(params[:id])
  end

  # POST /comments
  # POST /comments.json
  def create
    @comment = Comment.new(params[:comment])
    @post = Post.find(params[:post_id])
    @user_who_commented = current_user
   @comment = Comment.build_from( @post, @user_who_commented.id, @comment.body)
 
    if @comment.save
      redirect_to group_post_path(@post.group, @post), notice: 'Comment created.'
    end
    
    
  end

  # PUT /comments/1
  # PUT /comments/1.json
  def update
    @comment = Comment.find(params[:id])
    @post = Post.find(params[:post_id])

      if @comment.update_attributes(params[:comment])
        redirect_to group_post_path(@post.group, @post), notice: 'Comment updated.'
      end
    
  end

  # DELETE /comments/1
  # DELETE /comments/1.json
  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy

    respond_to do |format|
      format.html { redirect_to comments_url }
      format.json { head :no_content }
    end
  end
  
  
############### Replies

def create_reply
 # @post, @p_comment, @comment
  
  
  @comment1 = Comment.new(params[:comment])
  @post = Post.find(params[:post_id])
  @p_comment = Comment.find(params[:comment_id])
  @user_who_commented = current_user
  @comment1 = Comment.build_from( @post, @user_who_commented.id, @comment1.body)

  if @comment1.save
    @comment1.move_to_child_of(@p_comment)
    redirect_to group_post_path(@post.group, @post), notice: 'Reply created.'
  else
    redirect_to group_post_path(@post.group, @post), notice: 'Reply failed.'
  end
end  
  
def new_reply
  @comment = Comment.new
  @post = Post.find(params[:post_id])
  @p_comment = Comment.find(params[:comment_id])
  
  
  
end  
  
  
end
