require 'rails_helper'

describe 'Cars', type: :request do
  let!(:user1) { create(:user) }
  let!(:user2) { create(:user, name: 'Josh') }
  let!(:car) { create(:car, user: user1) }

  let(:login_response) do
    post '/login', params: { username: 'Peter' }
    JSON.parse(response.body)
  end

  # GET api/v1/cars
  describe 'GET / with empty or invalid JWT token' do
    it 'should return unauthorized status code' do
      headers = {
        Authorization: 'Bearer abc123',
        'Content-Type': 'application/json'
      }

      get('/api/v1/cars', headers:)
      expect(response).to have_http_status(:unauthorized)
    end
  end

  # # POST api/v1/cars
  describe 'POST /create with empty or invalid JWT token' do
    it 'should return unauthorized status code' do
      params = {
        name: 'MERCEDES BENZ G CLASS',
        description: 'MERCEDES G63 AMG - SERIES 21: S21-02',
        model: 'j66',
        price: '210',
        price_per_day: '210.6',
        images:
        [
          'https://example.com.jpg',
          'https://example.com.jpg',
          'https://example.com.jpg'
        ]
      }

      headers = {
        Authorization: 'Bearer abc123',
        'Content-Type': 'application/json'
      }

      # headers are missing
      post '/api/v1/cars', params: JSON.dump(params)
      expect(response).to have_http_status(:unauthorized)

      post('/api/v1/cars', params: JSON.dump(params), headers:)
      expect(response).to have_http_status(:unauthorized)
    end
  end
  describe 'POST /create with valid JWT token' do
    it 'should return unauthorized status code' do
      params = {
        name: 'MERCEDES BENZ G CLASS',
        description: 'MERCEDES G63 AMG - SERIES 21: S21-02',
        model: 'j66',
        price: '210',
        price_per_day: '210.6',
        images:
        [
          'https://example.com.jpg',
          'https://example.com.jpg',
          'https://example.com.jpg'
        ]
      }

      headers = {
        Authorization: 'Bearer abc123',
        'Content-Type': 'application/json'
      }

      # headers are missing
      post '/api/v1/cars', params: JSON.dump(params)
      expect(response).to have_http_status(:unauthorized)

      post('/api/v1/cars', params: JSON.dump(params), headers:)
      expect(response).to have_http_status(:unauthorized)
    end
  end
end
