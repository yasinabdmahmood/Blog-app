class PostsController < ApplicationController
  def index
    @user = User.find_by(id: params[:id])
    @posts = @user.posts
  end

  def show
    @post = Post.find_by(id: params[:post_id])
  end
end
