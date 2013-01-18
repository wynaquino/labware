class CommentsController < ApplicationController
  before_filter :authenticate_user!, :except => [:latest]
  before_filter :get_post, :except => [:destroy]

 
  def new
    @comment = Comment.new
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @comment }
    end
  end
  
  def edit
    @comment = current_user.comments.find(params[:id])
  end

  def create
    @comment = Comment.new(params[:comment])
    @comment = Comment.build_from( @post, current_user.id, @comment.body)
 
    if @comment.save
      @post.touch :post_updated_at
      redirect_to group_post_path(@post.group, @post), notice: 'Comment created.'
    end    
  end

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
  @comment1 = Comment.build_from(@post, current_user.id, @comment1.body)

  if @comment1.save
    @post.touch :post_updated_at
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
