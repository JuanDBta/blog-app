require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe 'GET #index' do
    it 'devuelve el status HTTP correcto' do
      get :index
      expect(response).to have_http_status(:ok)
    end

    it 'renderiza la plantilla index' do
      get :index
      expect(response).to render_template(:index)
    end

    it 'muestra los usuarios con datos correctos' do
      user1 = User.create(name: 'John', photo: 'john.jpg', posts_counter: 0)
      user2 = User.create(name: 'Jane', photo: 'jane.jpg', posts_counter: 1)

      get :index

      expect(assigns(:users)).to include(user1, user2)
    end
  end

  describe 'GET #show' do
    it 'devuelve el status HTTP correcto' do
      user = User.create(name: 'John', photo: 'john.jpg', bio: 'User bio', posts_counter: 0)
      get :show, params: { id: user.id }
      expect(response).to have_http_status(:ok)
    end

    it 'renderiza la plantilla show' do
      user = User.create(name: 'John', photo: 'john.jpg', bio: 'User bio', posts_counter: 0)
      get :show, params: { id: user.id }
      expect(response).to render_template(:show)
    end

    it 'muestra los detalles del usuario correctamente' do
        user = User.create(name: 'John', photo: 'john.jpg', bio: 'User bio', posts_counter: 0)
        user.save
        get :show, params: { id: user.id }
        expect(assigns(:user)).to eq(user)
        expect(response.body).to include('')
      end
  end
end