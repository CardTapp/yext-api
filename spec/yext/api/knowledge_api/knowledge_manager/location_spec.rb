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

  describe "show" do
    it_behaves_like("sets rate limits", lambda do
      location = Yext::Api::KnowledgeApi::KnowledgeManager::Location.account("my-test-account-id-2").find("my-test-location-id-2")

      expect(location.locationName).to eq "RSpec Test Location 1"
    end)
  end

  describe "save" do
    after(:each) do
      location = Yext::Api::KnowledgeApi::KnowledgeManager::Location.new(id:           "my-test-location-id-2",
                                                                         accountId:    "my-test-account-id-2",
                                                                         locationName: "RSpec Test Location 1")

      location.save(:locationName)
    end

    describe "saves only certain fields" do
      it_behaves_like("sets rate limits", lambda do
        location = Yext::Api::KnowledgeApi::KnowledgeManager::Location.account("my-test-account-id-2").find("my-test-location-id-2")

        expect(location.locationName).not_to eq "RSpec Test Changed Location 1"

        location = Yext::Api::KnowledgeApi::KnowledgeManager::Location.new(id:           "my-test-location-id-2",
                                                                           accountId:    "my-test-account-id-2",
                                                                           locationName: "RSpec Test Changed Location 1",
                                                                           address:      "1414 Mockingbird Ln.")

        location.save(:locationName)

        location = Yext::Api::KnowledgeApi::KnowledgeManager::Location.account("my-test-account-id-2").find("my-test-location-id-2")

        expect(location.locationName).to eq "RSpec Test Changed Location 1"
        expect(location.address).not_to eq "1414 Mockingbird Ln."
      end)
    end
  end

  describe "create" do
    it_behaves_like("sets rate limits", lambda do
      location = Yext::Api::KnowledgeApi::KnowledgeManager::Location.account("my-test-account-id-2").where(id: "my-test-location-id-3").get

      expect(location).not_to be

      location = Yext::Api::KnowledgeApi::KnowledgeManager::Location.new(create_id:          "my-test-location-id-3",
                                                                         account_id:         "my-test-account-id-2",
                                                                         accountId:          "my-test-account-id-2",
                                                                         locationType:       "LOCATION",
                                                                         locationName:       "RSpec Test Location 2",
                                                                         address:            "1020 Palm Drive",
                                                                         suppressAddress:    false,
                                                                         city:               "Krakow",
                                                                         state:              "MI",
                                                                         zip:                "90210",
                                                                         phone:              "312-555-1212",
                                                                         categoryIds:        ["1146752"],
                                                                         featuredMessage:    "2 locations to serve you better!",
                                                                         featuredMessageUrl: "https://www.cardtapp.com/buy",
                                                                         websiteUrl:         "https://www.cardtapp.com",
                                                                         description:        "My cool RSpec location addition",
                                                                         emails:             ["2@2.com"])

      location.save

      location = Yext::Api::KnowledgeApi::KnowledgeManager::Location.account("my-test-account-id-2").where(id: "my-test-location-id-3").get

      expect(location).to be
    end)
  end

  describe "search" do
    it_behaves_like("sets rate limits", lambda do
      locations = Yext::Api::KnowledgeApi::KnowledgeManager::Location.
          account("my-test-account-id-2").
          search(address: { contains: ["Morning Glory"] })

      expect(locations.length).to eq 1
      expect(locations.first.locationName).to eq "RSpec Test Location 2"
    end)
  end
end
