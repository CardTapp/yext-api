# frozen_string_literal: true

require "rails_helper"

RSpec.describe Yext::Api::Utils::Configuration do
  let(:configuration) { Yext::Api.configuration }

  around(:each) do |example_proxy|
    configuration = Yext::Api.configuration

    orig_account_id       = configuration.account_id
    orig_api_key          = configuration.api_key
    orig_api_version      = configuration.api_version
    orig_yext_username    = configuration.yext_username
    orig_yext_user_id     = configuration.yext_user_id
    orig_sandbox          = configuration.sandbox
    orig_validation_level = configuration.validation_level

    begin
      example_proxy.run
    ensure
      configuration.account_id       = orig_account_id
      configuration.api_key          = orig_api_key
      configuration.api_version      = orig_api_version
      configuration.yext_username    = orig_yext_username
      configuration.yext_user_id     = orig_yext_user_id
      configuration.sandbox          = orig_sandbox
      configuration.validation_level = orig_validation_level
    end
  end

  it "is a Singleton class" do
    expect(Yext::Api::Utils::Configuration.included_modules).to be_include(Singleton)
  end

  describe "validation_level" do
    Yext::Api::Enumerations::Validation.all.each do |validation_level|
      it "allows the value #{validation_level}" do
        expect { configuration.validation_level = validation_level }.not_to raise_error
      end
    end

    it "allows nil" do
      expect { configuration.validation_level = nil }.not_to raise_error
    end

    it "does not allow other strings" do
      expect { configuration.validation_level = "this is not a validation level" }.to raise_error ArgumentError
    end

    it "does not allow other data types" do
      expect { configuration.validation_level = false }.to raise_error ArgumentError
    end
  end

  it "allows the assignment of account_id" do
    configuration.account_id = "a fake value"
    expect(configuration.account_id).to eq "a fake value"
  end

  it "allows the assignment of api_key" do
    configuration.api_key = "a fake value"
    expect(configuration.api_key).to eq "a fake value"
  end

  it "allows the assignment of api_version" do
    configuration.api_version = "a fake value"
    expect(configuration.api_version).to eq "a fake value"
  end

  it "allows the assignment of yext_username" do
    configuration.yext_username = "a fake value"
    expect(configuration.yext_username).to eq "a fake value"
  end

  it "allows the assignment of yext_user_id" do
    configuration.yext_user_id = "a fake value"
    expect(configuration.yext_user_id).to eq "a fake value"
  end

  it "allows the assignment of sandbox" do
    configuration.sandbox = "a fake value"
    expect(configuration.sandbox).to eq "a fake value"
  end
end
