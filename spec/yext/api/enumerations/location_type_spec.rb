# frozen_string_literal: true

require "rails_helper"

RSpec.describe Yext::Api::Enumerations::LocationType do
  describe "all" do
    it "returns all request statuses" do
      expect(Yext::Api::Enumerations::LocationType.all.length).to eq 5
    end
  end
end
