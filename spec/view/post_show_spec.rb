require 'rails_helper'

RSpec.describe 'renders post index Page', type: :feature do
  before(:example) do
    @subject1 = User.create(Name: 'Alan Luqman', Photo: 'user_picture', Bio: 'Teacher from UK.', PostsCounter: 0)
    @subject2 = User.create(Name: 'Alex', Photo: 'picture', Bio: 'Teacher from USA.', PostsCounter: 0)
    @post = Post.create(author: @subject1, Title: 'Hello', Text: 'This is my first post', CommentsCounter: 0,
                        LikesCounter: 0)
    Comment.create(Text: 'this is my first comment', author: @subject2, post: @post)

    visit user_post_path(id: @subject1.id, post_id: @post.id)
  end

  it 'I can see the post Title.' do
    expect(page).to have_content(@post.Title)
  end

  it 'I can see who wrote the post.' do
    expect(page).to have_content(@subject1.Name)
  end

  it 'I can see how many comments it has.' do
    expect(page).to have_content(@post.CommentsCounter)
  end

  it 'I can see how many likes it has.' do
    expect(page).to have_content(@post.LikesCounter)
  end

  it 'I can see the post body.' do
    expect(page).to have_content(@post.Text)
  end

  it 'I can see the userName of each commentor.' do
    expect(page).to have_content(@subject2.Name)
  end

  it 'I can see the comment each commentor left.' do
    expect(page).to have_content('this is my first comment')
  end
end
