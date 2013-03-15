module PostsHelper
 
  def show_comments_with_children(comments)
    
     comments.each do |comment|
         
         yield comment
         if comment.children.any?
           concat <<-EOF.html_safe
             	<div class="span7 offset1-1 pcomment">
           EOF
            show_comments_with_children(comment.children) {                 |x| yield  x } #Dont worry, this will not run another query :)
               concat <<-EOF.html_safe
                 	</div>
               EOF
         end   
     end
  end
  
  def latest_comments
    @group = Group.find_by_url(params[:group_id])
    @post = Post.find_by_post_uuid(params[:post_id])  
    @comments = @post.root_comments.order("created_at DESC")
    render "show"
  end
  
  def oldest_comments
    @group = Group.find_by_url(params[:group_id])
    @post = Post.find_by_post_uuid(params[:post_id])  
    @comments = @post.root_comments.order("created_at ASC")
    render "show"
  end
  
  def highest_voted_comments
    @group = Group.find_by_url(params[:group_id])
    @post = Post.find_by_post_uuid(params[:post_id])  
    @comments = @post.root_comments.order("vote_count DESC")
    render "show"
  end
  
  
end
