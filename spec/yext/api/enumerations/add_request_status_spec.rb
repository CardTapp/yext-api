# frozen_string_literal: true

require "rails_helper"

RSpec.describe Yext::Api::Enumerations::AddRequestStatus do
  describe "all" do
    it "returns all request statuses" do
      expect(Yext::Api::Enumerations::AddRequestStatus.all.length).to eq 6
    end
  end
end
