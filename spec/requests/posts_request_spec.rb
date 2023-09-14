require 'rails_helper'

RSpec.describe Post, type: :request do
  let(:user) { User.create(name: 'John', posts_counter: 5) }
  let(:post) do
    Post.create(author: user, title: 'Post to be Destroyed', text: 'This post will be destroyed',
                commentscounter: 0, likescounter: 0)
  end
  describe 'Get/#index' do
    it 'returns a successful response for posts for specfic user' do
      get "/users/#{user.id}/posts"
      expect(response).to have_http_status(:success)
    end
    it 'renders the correct template for  posts of specfic user' do
      get "/users/#{user.id}/posts"
      expect(response).to render_template(:index)
    end
    it 'response body includes correct placeholder text for specfic user' do
      get "/users/#{user.id}/posts"
      expect(response.body).to include('Posts & Comments')
    end
  end

  describe 'GET /users/:user_id/posts/:id' do
    it 'returns a successful response for a specific post of a specific user' do
      get "/users/#{user.id}/posts/#{post.id}"
      expect(response).to have_http_status(:success)
    end

    it 'renders the correct template for a specific post of a specific user' do
      get "/users/#{user.id}/posts/#{post.id}"
      expect(response).to render_template(:show)
    end

    it 'response body includes correct placeholder text for a specific post of a specific user' do
      get "/users/#{user.id}/posts/#{post.id}"
      expect(response.body).to include('The Post')
    end
  end
end
