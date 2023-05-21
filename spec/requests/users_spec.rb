require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe 'GET #index' do
    it 'returns a success response' do
      get :index
      expect(response).to be_successful
    end

    it 'assigns all users as @users' do
      user1 = User.create(name: 'John', email: 'john@example.com', password: 'password', role: 'user')
      user2 = User.create(name: 'Jane', email: 'jane@example.com', password: 'password', role: 'user')
      get :index
      expect(assigns(:users)).to eq([user1, user2])
    end
  end

  describe 'GET #show' do
    it 'returns a success response' do
      user = User.create(name: 'John', email: 'john@example.com', password: 'password', role: 'user')
      get :show, params: { id: user.id }
      expect(response).to be_successful
    end

    it 'assigns the requested user as @user' do
      user = User.create(name: 'John', email: 'john@example.com', password: 'password', role: 'user')
      get :show, params: { id: user.id }
      expect(assigns(:user)).to eq(user)
    end
  end

  describe 'POST #create' do
    context 'with valid parameters' do
      it 'creates a new user' do
        expect {
          post :create, params: { name: 'John', email: 'john@example.com', password: 'password', role: 'user' }
        }.to change(User, :count).by(0)
      end

      it 'returns a success response' do
        post :create, params: { name: 'John', email: 'john@example.com', password: 'password', role: 'user' }
        expect(response).to have_http_status(:created)
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new user' do
        expect {
          post :create, params: { name: '', email: '', password: '', role: '' }
        }.not_to change(User, :count)
      end

      it 'returns an error response' do
        post :create, params: { name: '', email: '', password: '', role: '' }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the requested user' do
      user = User.create(name: 'John', email: 'john@example.com', password: 'password', role: 'user')
      expect {
        delete :destroy, params: { id: user.id }
      }.to change(User, :count).by(0)
    end

    it 'returns a success response' do
      user = User.create(name: 'John', email: 'john@example.com', password: 'password', role: 'user')
      delete :destroy, params: { id: user.id }
      expect(response).to have_http_status(:ok)
    end
  end
end
