class PostsController < ApplicationController
  def index
    @user = User.find_by(id: params[:id])
    @posts = @user.posts
  end

  def show
    @post = Post.find_by(id: params[:post_id])
  end

  def new
    @new_post = Post.new
    
  end
  def create
    @post = Post.new(post_params)
    @post.author = current_user
    @post.CommentsCounter = 0
    @post.LikesCounter = 0
    if @post.save
      redirect_to "/users/#{current_user.id}/posts"
    else
      render :new
    end
  end

  private

  def post_params
    params.require(:new_post).permit(:Title, :Text)
  end

end
