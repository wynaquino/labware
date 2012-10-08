class AssetsController < ApplicationController
  # GET /assets
  # GET /assets.json
  def index
    @user = User.find_by_username(params[:user_id])
    @user_assets = @user.assets.find(:all, :order => 'created_at DESC')
    @file = Asset.new
  end

  # GET /assets/1
  # GET /assets/1.json
  def show
    @asset = Asset.find(params[:id])
    @user = User.find_by_id(@asset.user.id)
  end

  def create
    @asset = Asset.new(params[:file])
    @asset.user_id = current_user.id
    
    respond_to do |format|
      if @asset.save
        @asset = Asset.new
        format.html { redirect_to user_assets_path(current_user.username) , notice: 'Asset was successfully created.' }
        format.json { render json: @asset, status: :created, location: @asset }
      else
        format.html { render action: "new" }
        format.json { render json: @asset.errors, status: :unprocessable_entity }
      end
    end
  end

 
  def destroy
    @asset = current_user.assets.find(params[:id])
    @asset.destroy
    redirect_to user_assets_path(current_user.username)
  end
end
