# frozen_string_literal: true

require "rails_helper"

RSpec.describe Yext::Api::AdministrativeApi::AddRequest, :vcr do
  it_behaves_like "default scopes"

  describe "index" do
    it_behaves_like "sets rate limits", -> { Yext::Api::AdministrativeApi::AddRequest.all.to_a }

    it "gets a list of add_requests" do
      Yext::Api::AdministrativeApi::AddRequest.uri
      add_requests = Yext::Api::AdministrativeApi::AddRequest.all.to_a

      expect(add_requests.length).to be_positive
      expect(add_requests.first.locationMode).to be_present
    end
  end

  describe "show" do
    it_behaves_like "sets rate limits", -> { Yext::Api::AdministrativeApi::AddRequest.find("223779") }

    it "gets a list of add_requests" do
      add_requests = Yext::Api::AdministrativeApi::AddRequest.find("223779")

      expect(add_requests.locationMode).to be_present
    end
  end
end
