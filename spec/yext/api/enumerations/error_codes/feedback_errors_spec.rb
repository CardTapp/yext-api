# frozen_string_literal: true

require "rails_helper"

RSpec.describe Yext::Api::Enumerations::ErrorCodes::FeedbackErrors do
  describe "all" do
    it_behaves_like "constants are Error Codes"

    it "returns all request statuses" do
      expect(Yext::Api::Enumerations::ErrorCodes::FeedbackErrors.all.count).to eq 8
    end
  end
end
