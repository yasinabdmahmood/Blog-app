require 'rails_helper'

RSpec.describe 'Post index page', type: :feature do
  before(:example) do
    @subject1 = User.create(Name: 'Alan Luqman', Photo: 'user_picture', Bio: 'Teacher from UK.', PostsCounter: 0)
    @subject2 = User.create(Name: 'Alex', Photo: 'picture', Bio: 'Teacher from UK.', PostsCounter: 0)
    @post = Post.create(author: @subject1, Title: 'Hello', Text: 'This is my first post', CommentsCounter: 0,
                        LikesCounter: 0)
    Comment.create(author: @subject2, post: @post, Text: 'this is first comment')

    visit posts_path(id: @subject1.id)
  end

  describe 'Post index page' do
    it 'I can see the user profile picture.' do
      find("img[src='user_picture']")
    end

    it 'I can see the user userName.' do
      expect(page).to have_content(@subject1.Name)
    end

    it 'I can see the number of posts the user has written.' do
      expect(page).to have_content(@subject1.PostsCounter)
    end

    it 'I can see a post Title.' do
      expect(page).to have_content(@post.Title)
    end

    it 'I can see some of the post body.' do
      expect(page).to have_content(@post.Text)
    end

    it 'I can see the first comments on a post.' do
      expect(page).to have_content('this is first comment')
    end

    it 'I can see how many comments a post has.' do
      expect(page).to have_content(@post.CommentsCounter)
    end

    it 'I can see how many likes a post has.' do
      expect(page).to have_content(@post.LikesCounter)
    end

    it 'to show the Pagination buttons' do
      expect(page).to have_content('Pagination')
    end

    it 'When I click on a post, it redirects me to that post show page.' do
      click_link(@post.Title)
      expect(current_path).to match user_post_path(id: @subject1.id, post_id: @post.id)
    end
  end
end
