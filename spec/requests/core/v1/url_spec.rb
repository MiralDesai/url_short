
# Have used VCR gem in the past to mock requests to third parties and local api calls like this

require 'rails_helper'

RSpec.describe 'Url API', type: :request, order: :defined do

  describe 'GET /api/v1/urls' do
    context 'with no params' do
      before do
        get '/api/v1/urls'
      end

      it 'should return an error' do
        expect(response).to have_http_status(:error)
      end
    end
  end

  describe 'when attempting to create a shortened url' do
    let(:url) { 'www.google.co.uk' }
    before do
      post '/api/v1/urls', params: { url: url }
    end

    it 'should return an ok http status' do
      expect(response).to have_http_status(:created)
    end

    it 'should return an path param' do
      expect(json_response['path']).to eq("https://#{url}")
    end

    it 'should return an short_path param' do
      expect(json_response['short_path']).to be_present
    end

    it 'should return an full_new_url param' do
      expect(json_response['full_new_url']).to be_present
    end

    it 'should return an alternative_url param' do
      expect(json_response['alternative_url']).to be_present
    end
  end

  describe 'when attemping to visit a shortened url' do
    let(:url) { FactoryBot.create(:url, path: 'www.google.co.uk') }
    before do
      get "/api/v1/urls/#{url.short_path}", params: { short_path: url.short_path }
    end

    it 'should redirect to the original path' do
      expect(response).to have_http_status(:redirect)
    end
  end
end
