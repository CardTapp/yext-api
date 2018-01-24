# frozen_string_literal: true

require "rails_helper"

# TODO: complete tests
RSpec.describe Yext::Api::KnowledgeApi::KnowledgeManager::Location, :vcr do
  it_behaves_like "default scopes"

  describe "index" do
    it_behaves_like "sets rate limits", -> { Yext::Api::KnowledgeApi::KnowledgeManager::Location.all.to_a }

    it "gets a list of locations" do
      locations = Yext::Api::KnowledgeApi::KnowledgeManager::Location.all.to_a

      expect(locations.length).to be_zero
      # expect(locations.first.name).to be_present
    end
  end
end
