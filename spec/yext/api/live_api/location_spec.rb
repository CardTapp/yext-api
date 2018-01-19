# frozen_string_literal: true

require "rails_helper"

RSpec.describe Yext::Api::LiveApi::Location, :vcr do
  it_behaves_like "default scopes"

  # I can't test live endpoints at this time yet.

  # describe "index" do
  #   it_behaves_like "sets rate limits", -> { Yext::Api::LiveApi::Location.all.to_a }
  #
  #   it "gets a list of locations" do
  #     locations = Yext::Api::LiveApi::Location.all.to_a
  #
  #     expect(locations.length).to be_positive
  #     expect(locations.first.name).to be_present
  #   end
  # end
end
