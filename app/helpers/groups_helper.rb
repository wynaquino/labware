module GroupsHelper
  def group_posts_latest_comment
    @group = Group.find_by_url(params[:group_id])
    @posts = @group.posts.paginate(:page => params[:page], :per_page => 30, :order => "is_sticky DESC, post_updated_at DESC") 
    

    render "show"
  end
end
