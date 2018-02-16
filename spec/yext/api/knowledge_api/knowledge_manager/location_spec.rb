# frozen_string_literal: true

require "rails_helper"

# TODO: complete tests
RSpec.describe Yext::Api::KnowledgeApi::KnowledgeManager::Location, :vcr do
  it_behaves_like "default scopes"

  describe "index" do
    it_behaves_like "sets rate limits", -> { Yext::Api::KnowledgeApi::KnowledgeManager::Location.account("my-test-account-id-2").all.to_a }

    it "gets a list of locations" do
      locations = Yext::Api::KnowledgeApi::KnowledgeManager::Location.account("my-test-account-id-2").all.to_a

      expect(locations.length).to eq 1
      expect(locations.first.locationName).to be_present
    end
  end

  # describe "create" do
  #   it_behaves_like("sets rate limits", lambda do
  #     # create a location
  #   end)
  # end
  #
  # describe "show" do
  # end
  #
  # describe "search" do
  # end
  #
  # describe "update" do
  # end
end
