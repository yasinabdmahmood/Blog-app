class CommentsController < ApplicationController
  def new
    @new_comment = Comment.new
  end

  def create
    @comment = Comment.new(post_params)
    @comment.author = current_user
    current_post = Post.find_by(id: params[:post_id])
    p current_post
    @comment.post = current_post
    if @comment.save
      current_post.CommentsCounter += 1
      current_post.save
      redirect_to "/users/#{current_user.id}/posts/#{params[:post_id]}"

    else
      render :new
    end
  end

  def destroy
    Comment.find_by(id: params[:comment_id]).destroy
    current_comments_counter=Post.find_by(id: params[:post_id])
    current_comments_counter.CommentsCounter-=1
    current_comments_counter.save
    redirect_to user_post_path(id: params[:id], post_id: params[:post_id])
  end

  private

  def post_params
    params.require(:new_comment).permit(:Text)
  end
end
