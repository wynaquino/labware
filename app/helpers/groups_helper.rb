module GroupsHelper
  def group_posts_latest_comment
    @group = Group.find_by_url(params[:group_id])
    @posts = @group.posts.order("post_updated_at DESC")
    render "show"
  end
end
