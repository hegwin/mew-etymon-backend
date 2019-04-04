require 'rails_helper'

RSpec.describe 'Graphql::EtymonsSearch', type: :request do
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
        create :etymon, spelling: 'inter-'
        create :etymon, spelling: 'kind-'
        create :etymon, spelling: 'para-'
      end

      it 'returns 200 success' do
        post '/graphql', params: { query: query_string }

        expect(response).to have_http_status :ok
        expect(data.keys).not_to include('errors')
      end

      it 'lists matched etymons' do
        post '/graphql', params: { query: query_string }
        expect(data['etymonsSearch'].map { |record| record['spelling'] }).to eq %w(inter- kind-)
      end
    end

    context 'when it matches none' do
      let(:q_etymon) { 'az' }

      it 'returns an empty array' do
        post '/graphql', params: { query: query_string }
        expect(data['etymonsSearch'].count).to be_zero
      end
    end
  end
end
