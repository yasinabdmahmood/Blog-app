require 'rails_helper'
RSpec.describe 'Posts', type: :request do
  describe 'GET #index' do
    it 'Check if response status is correct' do
      get '/users/:id/posts'
      expect(response).to have_http_status(:ok)
    end

    it "renders 'index' template" do
      get '/users/:id/posts'
      expect(response).to render_template('index')
    end

    it 'Check if the response body includes correct placeholder text.' do
      get '/users/:id/posts'
      expect(response.body).to include('Display All the posts for a specific user')
    end
  end

  describe 'GET #show' do
    it 'Check if response status is correct' do
      get '/users/:id/posts/:post_id'
      expect(response).to have_http_status(:ok)
    end

    it "renders 'show' template" do
      get '/users/:id/posts/:post_id'
      expect(response).to render_template('show')
    end

    it 'Check if the response body includes correct placeholder text.' do
      get '/users/:id/posts/:post_id'
      expect(response.body).to include('Display post by id  for a given user')
    end
  end
end
