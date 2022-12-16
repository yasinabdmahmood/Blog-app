class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find_by(id: params[:id])
    @posts = @user.retrieve_recent_posts
    respond_to do |format|
      format.html 
      format.json { render :json => @user.posts }
    end
  end
end
