require 'rails_helper'

RSpec.describe User, type: :request do
  describe '#index' do
    it 'returns a successful response' do
      get '/'
      expect(response).to have_http_status(:success)
    end
    it 'renders the correct template ' do
      get '/'
      expect(response).to render_template(:index)
    end
    it 'response body includes correct placeholder text ' do
      get '/'
      expect(response.body).to include('All Users')
    end
  end
  describe 'GET /show' do
    let(:user) { User.create(name: 'Helen', photo: 'https://unsplash/', bio: 'Programmer', posts_counter: 0) }
    it 'returns a successful response for specfic user' do
      get "/users/#{user.id}"
      expect(response).to have_http_status(:success)
    end
    it 'renders the correct template for specific user' do
      get "/users/#{user.id}"
      expect(response).to render_template(:show)
    end
    it 'response body includes correct placeholder text for specific user' do
      get "/users/#{user.id}"
      expect(response.body).to include('Display Posts by User')
    end
  end
end
