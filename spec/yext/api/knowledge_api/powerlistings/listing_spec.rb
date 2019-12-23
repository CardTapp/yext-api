# frozen_string_literal: true

require "rails_helper"

# TODO: complete tests
RSpec.describe Yext::Api::KnowledgeApi::Powerlistings::Listing, :vcr do
  it_behaves_like "default scopes"

  describe "index" do
    it_behaves_like("sets rate limits", -> { Yext::Api::KnowledgeApi::Powerlistings::Listing.account("my-test-account-id-2").get })

    it "gets a list of listings" do
      listings = Yext::Api::KnowledgeApi::Powerlistings::Listing.account("my-test-account-id-2").get

      expect(listings.count).to be_positive
      expect(listings.first.locationId).to be
    end
  end
end
