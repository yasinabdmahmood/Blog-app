require 'rails_helper'

RSpec.describe 'User show page', type: :feature do
  before(:example) do
    @subject1 = User.create(Name: 'Alan Luqman',
                            Photo: 'user_picture', PostsCounter: 0, Bio: 'Teacher from UK.')
    @post = Post.create(author: @subject1, Title: 'demo', Text: 'rails testing project', CommentsCounter: 0,
                        LikesCounter: 0)

    Post.create(author: @subject1, Title: 'nick', Text: 'nick start new role as web developer', CommentsCounter: 0,
                LikesCounter: 0)
    Post.create(author: @subject1, Title: 'rex', Text: 'rex start new role as web developer', CommentsCounter: 0,
                LikesCounter: 0)
    Post.create(author: @subject1, Title: 'ogaga', Text: 'ogaga start new role as web developer', CommentsCounter: 0,
                LikesCounter: 0)
    @subject1.PostsCounter += 1
    @subject1.save
    visit user_path(id: @subject1.id)
  end

  describe 'index page' do
    it '-> I can see the users profile picture.' do
      find("img[src='#{@subject1.Photo}']")
    end

    it '-> I can see the users username.' do
      expect(page).to have_content(@subject1.Name)
    end

    it '-> I can see the number of posts the user has written.' do
      expect(page).to have_content(@subject1.PostsCounter)
    end

    it '-> I can see the user bio.' do
      expect(page).to have_content(@subject1.Bio)
    end

    it '-> I can see the users first 3 posts.' do
      expect(page).to have_content('demo')
      expect(page).to have_content('rex')
      expect(page).to have_content('nick')
    end

    it '-> I can see a button that lets me view all of a users posts.' do
      expect(page).to have_link('See all posts') if @subject1.PostsCounter > 0
    end

    it '-> When I click a users post, it redirects me to that posts show page.' do
      visit posts_path(id: @subject1.id)
      click_link(@post.Title)
      expect(current_path).to eq user_post_path(id: @subject1.id, post_id: @post.id)
    end

    it '-> When I click to see See all posts, it redirects me to the users posts index page.' do
      if @subject1.PostsCounter > 0
        click_link('See all posts')
        expect(current_path).to eq "/users/#{@subject1.id}/posts/"
      else
        expect(page).to have_content('The list is empty for the posts by the user')
      end
    end
  end
end
