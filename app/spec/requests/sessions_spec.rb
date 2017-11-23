require 'rails_helper'

RSpec.describe 'Users API', type: :request do
  let!(:key) { create(:api_key) }
  let(:token) { key.token }

  describe 'GET /login' do
    let(:valid_attributes) { { email: 'sankarcule@gmail.com', password: '123456' } }
    before { get '/login', params: valid_attributes }

    it 'returns users' do
      expect(json).not_to be_empty
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  describe 'POST /register' do
    let(:valid_attributes) { { email: 'sankarcule@gmail.com', password: '123456' } }

    context 'when the request is valid' do
      before { post '/register', params: valid_attributes }

      it 'creates a topics_of_interest' do
        expect(json['id']).to eq('1,2,3')
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the request is invalid' do
      before { post '/register', params: { email: 'sankar', password: '123' } }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(response.body)
          .to match(/Validation failed/)
      end
    end
  end

  describe 'DELETE /logout' do
    let(:valid_attributes) { { token: '123' } }

    before { delete "/user/interests/remove", params: valid_attributes , { Authorization:  "Token 123"} }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end
