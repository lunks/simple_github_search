require 'rails_helper'

RSpec.describe RepositoriesController do
  describe 'GET #index' do
    let(:github_response) do
      [
        {
          name: "rails",
          owner: "rails",
          description: "Ruby on Rails",
          stars: 45011,
          forks: 17616
        }
      ]
    end

    before do
      github_client = double('GithubClient')
      expect(GithubClient).to receive(:new).and_return(github_client)
      expect(github_client).to receive(:repositories).with(search_query: "rails").and_return(github_response)
    end

    it "filters the repositories with the user query" do
      get :index, params: { query: "rails" }, format: :json
      expect(response.body).to eq github_response.to_json
    end

  end
end
