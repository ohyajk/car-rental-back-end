require 'rails_helper'

RSpec.describe Api::V1::UsersController, type: :controller do
  describe 'GET #index' do
    it 'returns a success response' do
      get :index
      expect(response).to be_successful
    end

    it 'returns a success response' do
      get :index
      expect(response).to be_successful
    end
  end

  describe 'GET #show' do
    it 'returns a success response' do
      user = User.create(name: 'John')
      get :show, params: { id: user.id }
      expect(response).to be_successful
    end

    it 'responds with successfull response' do
      user = User.create(name: 'John')
      get :show, params: { id: user.id }
      expect(response).to be_successful
    end
  end

  describe 'POST #create' do
    context 'with valid parameters' do
      it 'creates a new user' do
        expect do
          post :create, params: { name: 'John' }
        end.to change(User, :count).by(1)
      end

      it 'returns a success response' do
        post :create, params: { name: 'John' }
        expect(response).to have_http_status(:created)
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new user' do
        expect do
          post :create, params: { name: '' }
        end.not_to change(User, :count)
      end

      it 'returns an error response' do
        post :create, params: { name: '' }
        expect(response).to have_http_status(:bad_request)
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the requested user' do
      user = User.create(name: 'John')
      expect do
        delete :destroy, params: { id: user.id }
      end.to change(User, :count).by(-1)
    end

    it 'returns a success response' do
      user = User.create(name: 'John')
      delete :destroy, params: { id: user.id }
      expect(response).to have_http_status(:ok)
    end
  end
end
