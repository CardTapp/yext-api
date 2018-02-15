# frozen_string_literal: true

require "rails_helper"

RSpec.describe Yext::Api::Enumerations::ErrorCodes::LocationsErrors do
  describe "all" do
    it "returns all request statuses" do
      expect(Yext::Api::Enumerations::ErrorCodes::LocationsErrors.all.count).to eq 244
    end
  end
end
