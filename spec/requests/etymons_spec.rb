require 'rails_helper'

RSpec.describe "Etymons", type: :request do
  describe "GET /etymons" do
    it "works! (now write some real specs)" do
      get etymons_path
      expect(response).to have_http_status(200)
    end
  end
end
