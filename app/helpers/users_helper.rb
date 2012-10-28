module UsersHelper
  
  def comments_latest
    @user = User.find_by_username(params[:user_id])
    @comments = @user.comments.order('created_at DESC')
    render "show"
  end
  
  def posts_latest_comment
    @user = User.find_by_username(params[:user_id])
    @posts = @user.posts.order("post_updated_at DESC")
    render "show"
  end
  
  
end
