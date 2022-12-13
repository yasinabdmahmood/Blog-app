require 'rails_helper'

RSpec.describe 'User index page', type: :feature do
  before(:example) do
    @subject1 = User.create(Name: 'Alan Luqman', Photo: 'user_picture', PostsCounter: 0, Bio: 'Teacher from UK.')
    @subject2 = User.create(Name: 'Nich', Photo: 'user_picture', PostsCounter: 0, Bio: 'Teacher from Negiria.')

    visit users_path
  end

  describe 'user index page' do
    it ' -> I can see the username of all other users.' do
      expect(page).to have_content(@subject1.Name)
      expect(page).to have_content(@subject2.Name)
    end

    it ' -> I can see the profile picture for each user.' do
      visit user_path(id: @subject1.id)
      find("img[src='user_picture']")
    end

    it ' -> I can see the number of posts each user has written.' do
      expect(page).to have_content(@subject1.PostsCounter)
      expect(page).to have_content(@subject2.PostsCounter)
    end

    it ' -> When I click on a user, I am redirected to that user show page.' do
      click_link(@subject1.Name)
      expect(current_path).to match user_path(@subject1)
    end
  end
end
