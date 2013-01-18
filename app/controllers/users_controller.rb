class UsersController < ApplicationController

  before_filter :authenticate_user!, :except => [:show, :comments_latest, :posts_latest_comment]

  def show
    @user = User.find_by_username(params[:id])
    @posts = @user.posts.order("created_at DESC")
  end

  def new
    @user = User.new
  end

  def edit
    @user = current_user
  end

  def create
    @user = User.new(params[:user])

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
      else
        format.html { render action: "new" }
      end
    end
  end

  def update
    @user = current_user

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to user_path(current_user.username), notice: 'User was successfully updated.' }
      else
        format.html { render action: "edit" }
      end
    end
  end

end
