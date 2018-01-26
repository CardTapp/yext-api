# frozen_string_literal: true

require "rails_helper"

RSpec.describe Yext::Api::Concerns::AccountChild do
  class FakeSpyke < Spyke::Base
    include Yext::Api::Concerns::AccountChild
  end

  class OtherFakeSpyke < Spyke::Base
    uri "fakespyke"

    include Yext::Api::Concerns::AccountChild
  end

  after(:each) do
    FakeSpyke.current_scope = nil
  end

  around(:each) do |example_proxy|
    original_account_id = Yext::Api.configuration.account_id

    begin
      Yext::Api.configuration.account_id = "testing account_id"
      example_proxy.call
    ensure
      Yext::Api.configuration.account_id = original_account_id
    end
  end

  describe "default_scope" do
    let(:fake_spyke) { FakeSpyke.new }
    let(:path) { Spyke::Path.new(FakeSpyke.all.uri, fake_spyke.attributes) }

    it "includes the configured account_id in the path" do
      expect(path.to_s).to be_include("accounts/testing%20account_id/")
    end

    it "includes the passed account_id using with_account" do
      FakeSpyke.current_scope = FakeSpyke.with_account("another account_id")

      expect(path.to_s).to be_include("accounts/another%20account_id/")
    end

    it "includes the passed account_id using with_account with an KnowledgeApi account" do
      FakeSpyke.current_scope = FakeSpyke.with_account(Yext::Api::KnowledgeApi::AccountSettings::Account.new(id: "another account_id"))

      expect(path.to_s).to be_include("accounts/another%20account_id/")
    end

    it "includes the passed account_id using with_account with an AdministrativeApi account" do
      FakeSpyke.current_scope = FakeSpyke.with_account(Yext::Api::AdministrativeApi::Account.new(id: "another account_id"))

      expect(path.to_s).to be_include("accounts/another%20account_id/")
    end

    it "includes the passed account_id using using where" do
      FakeSpyke.current_scope = FakeSpyke.where(account_id: "yet another account_id")

      expect(path.to_s).to be_include("accounts/yet%20another%20account_id/")
    end

    it "includes me as the account_id configuration is nil" do
      Yext::Api.configuration.account_id = nil

      expect(path.to_s).to be_include("accounts/me/")
    end

    it "includes custom routes" do
      fake_spyke = OtherFakeSpyke.new
      path       = Spyke::Path.new(OtherFakeSpyke.all.uri, fake_spyke.attributes)

      expect(path.to_s).to eq "accounts/testing%20account_id/fakespyke"
    end
  end

  describe "with_account_path" do
    it "prepends accounts/:account_id if no start /" do
      expect(Yext::Api::Concerns::AccountChild.with_account_path("fake_path")).to eq "accounts/:account_id/fake_path"
    end

    it "prepends accounts/:account_id if start /" do
      expect(Yext::Api::Concerns::AccountChild.with_account_path("/fake_path")).to eq "accounts/:account_id/fake_path"
    end
  end
end
