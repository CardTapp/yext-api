# frozen_string_literal: true

require "rails_helper"

RSpec.describe Yext::Api::Enumerations::ErrorCodes::CustomersErrros do
  describe "all" do
    it "returns all request statuses" do
      expect(Yext::Api::Enumerations::ErrorCodes::CustomersErrros.all.count).to eq 33
    end
  end
end
