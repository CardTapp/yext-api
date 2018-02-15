# frozen_string_literal: true

require "rails_helper"

RSpec.describe Yext::Api::Enumerations::ErrorCodes::SubscriptionsErrors do
  describe "all" do
    it "returns all request statuses" do
      expect(Yext::Api::Enumerations::ErrorCodes::SubscriptionsErrors.all.count).to eq 53
    end
  end
end
