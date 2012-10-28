module ApplicationHelper
  
  def check_user_permission(p_id, c_id)
    if p_id.to_i == c_id.id
      return true
    else
      return false
    end 
  end
  
  def getGroupsToolbar
    @groups = Group.find(:all, :conditions => ["frontpage = 't'"], :order => "created_at ASC", :limit => 5)
    return  @groups
  end
  
  def getPic(content)
    
    return content[/!(.*?)!/i,1]
      
  end
  
  

    
  def title
    base_title = "Labware"
    if @title.nil?
      base_title
    else
      "#{base_title} | #{@title}"
    end
  end
  
end
