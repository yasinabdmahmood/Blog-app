class PostsController < ApplicationController
  def index
    @user = User.includes(:posts).find_by(id: params[:id])
  end

  def show
    @post = Post.find_by(id: params[:post_id])
  end

  def new
    @new_post = Post.new
  end

  def create
    @post = Post.new(post_params)
    current_user.PostsCounter += 1
    current_user.save
    @post.author = current_user
    @post.CommentsCounter = 0
    @post.LikesCounter = 0
    if @post.save
      redirect_to "/users/#{current_user.id}/posts"
    else
      render :new
    end
  end

  def destroy
    # grap the post to be deleted
    current_post = Post.find_by(id: params[:post_id])
    authorize! :destroy, current_post

    # delete all the comments for the post
    current_post.comments.each(&:destroy)
    # delete all the likes for the post
    current_post.likes.each(&:destroy)

    # delete the post itself
    current_post.destroy

    # decrease the number of posts counter for the owner of the deleted post by one
    user_post_counter = User.find_by(id: params[:id])
    user_post_counter.PostsCounter -= 1
    user_post_counter.save

    # redirect to the page that shows all the posts for the user of deleted post
    redirect_to posts_path(id: params[:id])
  end

  private

  def post_params
    params.require(:new_post).permit(:Title, :Text)
  end
end
