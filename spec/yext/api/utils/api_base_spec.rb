# frozen_string_literal: true

require "rails_helper"

RSpec.describe Yext::Api::Utils::ApiBase do
  it "includes default scopes" do
    expect(Yext::Api::Utils::ApiBase.included_modules).to be_include(Yext::Api::Concerns::DefaultScopes)
  end

  it "is a child of Spyke::Base" do
    expect(Yext::Api::Utils::ApiBase <= Spyke::Base).to be_truthy
  end
end
