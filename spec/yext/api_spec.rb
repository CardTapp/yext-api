# frozen_string_literal: true

require "rails_helper"

RSpec.describe Yext::Api do
  it "has a version number" do
    expect(Yext::Api::VERSION).not_to be nil
  end

  it "configuration returns the Configuration instance" do
    expect(Yext::Api.configuration).to eq Yext::Api::Utils::Configuration.instance
  end

  it "configure returns the Configuration instance" do
    Yext::Api.configure do |configuration|
      expect(configuration).to eq Yext::Api::Utils::Configuration.instance
    end
  end
end
