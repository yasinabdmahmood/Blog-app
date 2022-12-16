class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find_by(id: params[:id])
    @posts = @user.retrieve_recent_posts
    respond_to do |format|
      format.html
      format.json do
        if current_user.id == params[:id].to_i
          render json: @user.posts
        else
          render html: "You are not authorized to see someone else's data"
        end
      end
    end
  end
end
