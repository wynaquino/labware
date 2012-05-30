module ApplicationHelper
  
  def check_user_permission(p_id, c_id)
    if p_id.to_i == c_id.id
      return true
    else
      return false
    end
    
  end
  
  
end
