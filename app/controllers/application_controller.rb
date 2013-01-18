
class ApplicationController < ActionController::Base
  include UsersHelper, GroupsHelper, PostsHelper
  protect_from_forgery
  #test for forum

   rescue_from ActiveRecord::RecordNotFound, :with => :rescue_not_found

   protected
  
   def rescue_not_found
     redirect_to root_path, notice: 'Opps....something went wrong'
   end
   
   def group_access
     @group = Group.find_by_url(params[:id])
     
     if user_signed_in?
        if @group.is_private == true and current_user.id == @group.user_id
          return
        end

        if @group.is_private == true and current_user.id != @group.user_id
          render "show_noaccess"
        end
      end

      if !user_signed_in?
        if @group.is_private == false
          return
        end

        if @group.is_private == true 
          render "show_noaccess"
        end
      end
   end
   
   
   def get_post
     return @post = Post.find_by_post_uuid(params[:post_id])
   end
  
    def after_sign_in_path_for(resource)
     stored_location_for(resource) || user_path(current_user.username)
   end

   def check_view_access
     @post = Post.find_by_post_uuid(params[:id])
     @group = @post.group

     if user_signed_in?
       if @post.group.is_private == true and current_user.id == @post.group.user_id
         return
       end
       if @post.group.is_private == true and current_user.id != @post.user_id
         render "/groups/show_noaccess"
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
