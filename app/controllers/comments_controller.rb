class CommentsController < ApplicationController
  before_filter :authenticate_user!, :except => [:index, :show]
  before_filter :get_post, :except => [:index, :show, :destroy]

 
  def new
    @comment = Comment.new
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @comment }
    end
  end
  


  # GET /comments/1/edit
  def edit
    @comment = current_user.comments.find(params[:id])
  end

  # POST /comments
  # POST /comments.json
  def create
    @comment = Comment.new(params[:comment])
    @comment = Comment.build_from( @post, current_user.id, @comment.body)
 
    if @comment.save
      @post.touch :post_updated_at
      redirect_to group_post_path(@post.group, @post), notice: 'Comment created.'
    end
    
    
  end

  # PUT /comments/1
  # PUT /comments/1.json
  def update
    @comment = current_user.comments.find(params[:id])
    if params[:comment][:body].length < 1
      params[:comment][:body] = "..."
    end
    if @comment.update_attributes(params[:comment])
      @post.touch :post_updated_at
      redirect_to group_post_path(@post.group, @post), notice: 'Comment updated.'
    end    
  end

  
############### Replies

def create_reply
  @comment1 = Comment.new(params[:comment])
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
  @p_comment = Comment.find(params[:comment_id])
end  

  
end
