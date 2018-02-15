# frozen_string_literal: true

require "rails_helper"

RSpec.describe Yext::Api::Enumerations::ErrorCodes::OptimizationsErrors do
  describe "all" do
    it_behaves_like "constants are Error Codes"

    it "returns all request statuses" do
      expect(Yext::Api::Enumerations::ErrorCodes::OptimizationsErrors.all.count).to eq 2
    end
  end
end
