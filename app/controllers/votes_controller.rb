class VotesController < ApplicationController
  before_filter :authenticate_user!

  def create

    @post = Post.find_by_post_uuid(params[:post_id])
    Post.increment_counter(:vote_count, @post.id)
    @post.vote :voter => current_user, :vote => 'thumbs up'
    redirect_to group_post_path(@post.group, @post), notice: 'Added the thumbs up!'
    
  end

  def create_comment_vote
    @post = Post.find_by_post_uuid(params[:post_id])
    @comment = Comment.find(params[:comment_id])
    Comment.increment_counter(:vote_count, params[:comment_id])
    @comment.vote :voter => current_user, :vote => 'thumbs up'
    redirect_to group_post_path(@post.group, @post), notice: 'Added the thumbs up!'
  end


end
