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

    FakeSpyke.reset_uri
    OtherFakeSpyke.reset_uri
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

    it "includes the passed account_id using account" do
      FakeSpyke.current_scope = FakeSpyke.account("another account_id")

      expect(path.to_s).to be_include("accounts/another%20account_id/")
    end

    it "includes the passed account_id using account with an KnowledgeApi account" do
      FakeSpyke.current_scope = FakeSpyke.account(Yext::Api::KnowledgeApi::AccountSettings::Account.new(id: "another account_id"))

      expect(path.to_s).to be_include("accounts/another%20account_id/")
    end

    it "includes the passed account_id using account with an AdministrativeApi account" do
      FakeSpyke.current_scope = FakeSpyke.account(Yext::Api::AdministrativeApi::Account.new(id: "another account_id"))

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

  shared_examples("it cleans up associations") do
    it "resets the association" do
      account_class.new(id: "account_id").other_fake_spykes.with("accounts/:account_id/other_custom_path/(:id)")
      account_class.new(id: "account_id").fake_spykes.with("accounts/:account_id/custom_path/(:id)")

      expect(account_class.new(id: "account_id").other_fake_spykes.uri.to_s).to eq "accounts/:account_id/other_custom_path/(:id)"
      expect(account_class.new(id: "account_id").fake_spykes.uri.to_s).to eq "accounts/:account_id/custom_path/(:id)"

      OtherFakeSpyke.reset_uri

      expect(OtherFakeSpyke.new.uri.to_s).to eq "accounts/testing%20account_id/fakespyke"
      expect(account_class.new(id: "account_id").other_fake_spykes.uri.to_s).to eq "accounts/:account_id/fakespyke"
      expect(account_class.new(id: "account_id").fake_spykes.uri.to_s).to eq "accounts/:account_id/custom_path/(:id)"
    end
  end

  describe Yext::Api::KnowledgeApi::AccountSettings::Account do
    let(:account_class) { Yext::Api::KnowledgeApi::AccountSettings::Account }

    it_behaves_like "it cleans up associations"
  end

  describe Yext::Api::AdministrativeApi::Account do
    let(:account_class) { Yext::Api::AdministrativeApi::Account }

    it_behaves_like "it cleans up associations"
  end

  describe "The problem in Spyke" do
    class ChildSpyke < Spyke::Base
    end

    class ParentSpyke < Spyke::Base
      has_many :child_spykes, class_name: "ChildSpyke"
    end

    it "resets the association" do
      expect(ParentSpyke.new(id: 1).child_spykes.uri).to eq "parent_spykes/:parent_spyke_id/child_spykes/(:id)"
      ParentSpyke.new(id: 1).child_spykes.with("parent_spykes/(:parent_spyke_id)/custom_path_spyke/(:id)")

      pending "this next line fails"
      expect(ParentSpyke.new(id: 1).child_spykes.uri).to eq "parent_spykes/:parent_spyke_id/child_spykes/(:id)"
    end
  end
end
