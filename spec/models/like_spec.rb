require 'rails_helper'
RSpec.describe Like, type: :model do
  before :each do
    @user = User.new(Name: 'yasin', Photo: 'https://avatars.githubusercontent.com/u/9&v=4',
                     Bio: 'Web developer from Iraq', PostsCounter: 0)
    @post = Post.new(author: @user, Title: 'My first post', Text: 'this post is for testing purpuse',
                     CommentsCounter: 0, LikesCounter: 0)
    @like = Like.new(author: @user, post: @post)
  end

  it 'test update_likes_counter' do
    @like.update_likes_counter
    expect(@post.LikesCounter).to eq 1
  end
end
