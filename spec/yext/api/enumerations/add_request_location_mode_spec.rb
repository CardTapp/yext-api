# frozen_string_literal: true

require "rails_helper"

RSpec.describe Yext::Api::Enumerations::AddRequestLocationMode do
  describe "all" do
    it "returns all request statuses" do
      expect(Yext::Api::Enumerations::AddRequestLocationMode.all.length).to eq 2
    end
  end
end
