
class ApplicationController < ActionController::Base
  protect_from_forgery
  #test for forum

   
   
  
    def after_sign_in_path_for(resource)
     stored_location_for(resource) || user_path(current_user)
   end

   def check_view_access
     @post = Post.find(params[:id])
     #@group = Group.find_by_url(params[:group_id])

     if user_signed_in?
       if @post.group.is_private == true and current_user.id != @post.user_id
         render "/groups/show_noaccess"
       else
         return
       end
     end

     if !user_signed_in?
         if @post.group.is_private == true
           render "/groups/show_noaccess"
         else
           return
         end
     end  
   end

end
