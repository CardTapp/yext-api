# frozen_string_literal: true

require "rails_helper"

RSpec.describe Yext::Api::Enumerations::ErrorCodes::GeneralErrors do
  describe "all" do
    it_behaves_like "constants are Error Codes"

    it "returns all request statuses" do
      expect(Yext::Api::Enumerations::ErrorCodes::GeneralErrors.all.count).to eq 28
    end
  end
end
