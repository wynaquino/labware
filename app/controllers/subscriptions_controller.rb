class SubscriptionsController < ApplicationController

  before_filter :authenticate_user!


  def create
    @subscription = Subscription.find_or_create_by_group_id_and_user_id(params[:group_id], current_user.id)
    
    respond_to do |format|
      if @subscription.save
        format.html { redirect_to group_path(@subscription.group), notice: 'Subscription was successfully created.' }
      end
     end
  end

  def destroy
    @subscription = Subscription.find(:first, :conditions => ["id = ? and user_id = ?", params[:id], current_user.id])
    @subscription.destroy
    
    respond_to do |format|
      format.html { redirect_to group_path(@subscription.group) }
    end
  end
end
