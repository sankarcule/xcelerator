require 'rails_helper'

RSpec.describe 'TopicsOfInterest API', type: :request do
  let!(:topics_of_interests) { create_list(:topics_of_interest, 10) }
  let(:topics_of_interest_id) { topics_of_interests.first.id }

  describe 'GET /topics_of_interests' do
    before { get '/user/interests', {}, { Authorization:  "Token 123"} }

    it 'returns topics_of_interests' do
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  describe 'POST /topics_of_interests' do
    let(:valid_attributes) { { interests: [1,2,3], user_id: 1 } }

    context 'when the request is valid' do
      before { post '/user/interests/add', params: valid_attributes, { Authorization:  "Token 123"} }

      it 'creates a topics_of_interest' do
        expect(json['id']).to eq('1,2,3')
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the request is invalid' do
      before { post '/user/interests/add', params: { interests: [1,2,3] }, { Authorization:  "Token 123"} }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(response.body)
          .to match(/Validation failed: User id can't be blank/)
      end
    end
  end

  describe 'DELETE /topics_of_interests' do
    let(:valid_attributes) { { interests: 1, user_id: 1 } }

    before { delete "/user/interests/remove", params: valid_attributes }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end
