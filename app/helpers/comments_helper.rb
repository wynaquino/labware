module CommentsHelper
  def posts_comments_latest
    @group = Group.find_by_url(params[:group_id])
    @posts = @group.posts.order("is_sticky DESC, post_updated_at DESC")
    render "show"
  end
  


end
