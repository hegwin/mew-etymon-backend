require 'rails_helper'

RSpec.describe 'Graphql::SearchEtymons', type: :request do
  describe 'search_etymons' do
    let(:query_string) do
      %|{
        etymonsSearch(spelling_cont: "#{q_etymon}") {
          id
          spelling
          meaning
        }
      }|
    end

    context 'when it matches some' do
      let(:q_etymon) { 'i' }
      before do
        FactoryBot.create :etymon, spelling: 'inter'
      end

      it 'returns 200 success' do
        post '/graphql', params: { query: query_string }

        expect(response).to have_http_status :ok
        expect(JSON.parse(response.body).keys).not_to include('errors')
      end
    end
  end
end