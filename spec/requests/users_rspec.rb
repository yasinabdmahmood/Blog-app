require 'rails_helper'
RSpec.describe 'Users', type: :request do
  describe 'GET #index' do
    it 'Check if response status is correct' do
      get '/'
      expect(response).to have_http_status(:ok)
    end

    it "renders 'index' template" do
      get '/'
      expect(response).to render_template('index')
    end

    it 'Check if the response body includes correct placeholder text.' do
      get '/'
      expect(response.body).to include('Display All the users')
    end
  end

  describe 'GET #show' do
    it 'Check if response status is correct' do
      get '/users/:id'
      expect(response).to have_http_status(:ok)
    end

    it "renders 'show' template" do
      get '/users/:id'
      expect(response).to render_template('show')
    end

    it 'Check if the response body includes correct placeholder text.' do
      get '/users/:id'
      expect(response.body).to include('Display a user by id')
    end
  end
end
