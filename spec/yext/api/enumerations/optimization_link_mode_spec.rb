# frozen_string_literal: true

require "rails_helper"

RSpec.describe Yext::Api::Enumerations::OptimizationLinkMode do
  describe "all" do
    it "returns all request statuses" do
      expect(Yext::Api::Enumerations::OptimizationLinkMode.all.length).to eq 3
    end
  end
end
