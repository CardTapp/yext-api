# frozen_string_literal: true

require "rails_helper"

RSpec.describe Yext::Api::Enumerations::Validation do
  describe "all" do
    it "returns all validation levels" do
      expect(Yext::Api::Enumerations::Validation.all.length).to eq 2
    end
  end
end
