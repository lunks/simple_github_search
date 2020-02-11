require "rails_helper"

RSpec.describe GithubClient, :vcr do
  describe "#repositories" do
    it "finds repository by name" do
      query = GithubClient.new.repositories(search_query: "rails", per_page: 1)
      expect(query).to eq([
        {
          name: "rails",
          owner: "rails",
          description: "Ruby on Rails",
          stars: 45011,
          forks: 17616
        }
      ])
    end
  end
end
