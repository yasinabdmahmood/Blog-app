require 'rails_helper'
RSpec.describe Post, type: :model do
  subject { Post.new(Title: 'Hello', Text: 'This is my first post', CommentsCounter: 8, LikesCounter: 15) }
  before { subject.save }

  before :all do
    @user = User.new(Name: 'yasin', Photo: 'https://avatars.githubusercontent.com/u/9&v=4',
                     Bio: 'Web developer from Iraq', PostsCounter: 0)
    @post = Post.new(author: @user, Title: 'My first post', Text: 'this post is for testing purpuse',
                     CommentsCounter: 0, LikesCounter: 0)
    @comment1 = Comment.create(Text: 'c1', author: @user, post: @post)
    @comment2 = Comment.create(Text: 'c2', author: @user, post: @post)
    @comment3 = Comment.create(Text: 'c3', author: @user, post: @post)
    @comment4 = Comment.create(Text: 'c4', author: @user, post: @post)
    @comment5 = Comment.create(Text: 'c5', author: @user, post: @post)
  end

  it 'test retrieve_recent_comments' do
    array = @post.retrieve_recent_comments
    expect(array.length).to eq 5
  end

  it 'test update_post_counter' do
    @post.update_post_counter
    expect(@user.PostsCounter).to eq 1
  end

  it 'Title  must not be blank' do
    subject.Title = nil
    expect(subject).to_not be_valid
  end

  it 'Title must not exceed 250 characters' do
    subject.Title = 'x' * 251
    expect(subject).to_not be_valid
  end

  it 'CommentsCounter must be an integer' do
    subject.CommentsCounter = 'x'
    expect(subject).to_not be_valid
  end

  it 'CommentsCounter must be greater than or equal to zero.' do
    subject.CommentsCounter = -7
    expect(subject).to_not be_valid
  end

  it 'LikesCounter  must be an integer' do
    subject.LikesCounter = 'x'
    expect(subject).to_not be_valid
  end

  it 'LikesCounter  must be greater than or equal to zero.' do
    subject.LikesCounter = -7
    expect(subject).to_not be_valid
  end
end
