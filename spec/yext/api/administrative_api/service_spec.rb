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

  describe "cancel_services" do
    it "cancels services" do
      pending "This is not available for testing yet."

      expect(true).to be_falsey
    end
  end
end
