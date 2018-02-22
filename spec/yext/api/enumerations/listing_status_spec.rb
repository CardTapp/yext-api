# frozen_string_literal: true

require "rails_helper"

RSpec.describe Yext::Api::Enumerations::ListingStatus do
  describe "all" do
    it "returns all request statuses" do
      expect(Yext::Api::Enumerations::ListingStatus.all.length).to eq 6
    end
  end
end
