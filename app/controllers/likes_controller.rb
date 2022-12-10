class LikesController < ApplicationController
    
    def create
      current_post = Post.find_by(id: params[:post_id]) 
      like = Like.new(author: current_user, post: current_post )
      current_post.LikesCounter +=1
      current_post.save
      like.save
      if like.save
        redirect_to "/users/#{current_user.id}/posts/#{params[:post_id]}"
      end
    end
  
    private
  
    
  
  end
  