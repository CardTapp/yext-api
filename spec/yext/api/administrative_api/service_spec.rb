# frozen_string_literal: true

require "rails_helper"

RSpec.describe Yext::Api::AdministrativeApi::Service, :vcr do
  it_behaves_like "default scopes"

  describe "index" do
    it_behaves_like "sets rate limits", -> { Yext::Api::AdministrativeApi::Service.all.to_a }

    it "gets a list of services" do
      services = Yext::Api::AdministrativeApi::Service.all.to_a

      expect(services.length).to be_positive
      expect(services.first.sku).to be_present
    end
  end

  describe "available" do
    it_behaves_like "sets rate limits", -> { Yext::Api::AdministrativeApi::Service.available.to_a }

    it "gets a list of services" do
      services = Yext::Api::AdministrativeApi::Service.available.to_a

      expect(services.length).to be_positive
      expect(services.first.sku).to be_present
    end
  end

  describe "cancel_services!" do
    after(:each) do
      Yext::Api::AdministrativeApi::AddRequest.add_services!(existingLocationId:        "my-test-location-id-2",
                                                             existingLocationAccountId: "my-test-account-id-2",
                                                             skus:                      ["DEV-00010000"])
    end

    it "remove services from existing locations" do
      expect { Yext::Api::AdministrativeApi::Service.cancel_services!(locationId: "my-test-location-id-2") }.
          to(change { Yext::Api::AdministrativeApi::Service.all.to_a.count }.by(-1))
    end

    it "can be called from a location" do
      location = Yext::Api::KnowledgeApi::KnowledgeManager::Location.account("my-test-account-id-2").find("my-test-location-id-2")

      expect { location.cancel_services! }.
          to(change { Yext::Api::AdministrativeApi::Service.all.to_a.count }.by(-1))
    end
  end
end
