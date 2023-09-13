require 'rails_helper'

RSpec.describe Post, type: :request do
  let(:user) { User.create(name: 'Meron Demeke', posts_counter: 0) }
  let(:post) { user.posts.create(title: 'New post by meron') }
  describe 'Get/#index' do
    it 'returns a successful response for posts for specific user' do
      get "/users/#{user.id}/posts"
      expect(response).to have_http_status(:success)
    end
    it 'renders the correct template for posts of specific user' do
      get "/users/#{user.id}/posts"
      expect(response).to render_template(:index)
    end
    it 'response body includes correct placeholder text for specific user' do
      get "/users/#{user.id}/posts"
      expect(response.body).to include('Posts & Comments')
    end
  end
  describe 'Get/#show' do
    it 'returns a successful response for posts for specific user' do
      get "/users/#{user.id}/posts/#{post.id}"
      expect(response).to have_http_status(:success)
    end
    it 'renders the correct template for specific post of specific user' do
      get "/users/#{user.id}/posts/#{post.id}"
      expect(response).to render_template(:show)
    end
    it 'response body includes correct placeholder text for specific user' do
      get "/users/#{user.id}/posts/#{post.id}"
      expect(response.body).to include('Whole Post')
    end
  end
end