require 'rails_helper'
RSpec.describe User, type: :model do
  subject { User.new(Name: 'Tom', Photo: 'https://unsplash.com/photos/F_-0BxGuVvo', Bio: 'Teacher from Mexico.') }
  before { subject.save }

  before :all do
    @user = User.new(Name: 'yasin', Photo: 'https://avatars.githubusercontent.com/u/9&v=4',
                     Bio: 'Web developer from Iraq', PostsCounter: 0)
    @post1 = Post.create(author: @user, Title: 't1', Text: 'this post is for testing purpuse', CommnetsCounter: 0,
                         LikesCounter: 0)
    @post2 = Post.create(author: @user, Title: 't1', Text: 'this post is for testing purpuse', CommnetsCounter: 0,
                         LikesCounter: 0)
    @post3 = Post.create(author: @user, Title: 't1', Text: 'this post is for testing purpuse', CommnetsCounter: 0,
                         LikesCounter: 0)
  end

  it 'test retrieve_recent_posts' do
    array = @user.retrieve_recent_posts
    expect(array.length).to eq 3
  end

  it 'Name must not be blank' do
    subject.Name = nil
    expect(subject).to_not be_valid
  end

  it 'PostsCounter must be an integer ' do
    subject.PostsCounter = 'xyz'
    expect(subject).to_not be_valid
  end

  it 'PostsCounter must be  greater than or equal to zero' do
    subject.PostsCounter = -1
    expect(subject).to_not be_valid
  end
end
