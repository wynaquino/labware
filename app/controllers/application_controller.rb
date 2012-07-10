
class ApplicationController < ActionController::Base
  protect_from_forgery
  #test for forum
  rescue_from ActiveRecord::RecordNotFound, :with => :render_record_not_found

   # Catch record not found for Active Record
   def render_record_not_found
     render :template => "../../public/500.html", :layout => false, :status => 500
   end

   # Catches any missing methods and calls the general render_missing_page method
   def method_missing(*args)
     render_missing_page # calls my common 404 rendering method
   end

   # General method to render a 404
   def render_missing_page
     render :template => "../../public/404.html", :layout => false, :status => 500
   end
   
   
  
    def after_sign_in_path_for(resource)
     stored_location_for(resource) || user_path(current_user)
   end

   def check_view_access
     @post = Post.find(params[:id])
     @group = Group.find(params[:group_id])

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
