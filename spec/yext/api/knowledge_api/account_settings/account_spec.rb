# frozen_string_literal: true

require "rails_helper"

RSpec.describe Yext::Api::KnowledgeApi::AccountSettings::Account, :vcr do
  it_behaves_like "default scopes"

  describe "index" do
    it_behaves_like "sets rate limits", -> { Yext::Api::KnowledgeApi::AccountSettings::Account.all.to_a }

    it "gets a list of accounts" do
      accounts = Yext::Api::KnowledgeApi::AccountSettings::Account.all.to_a

      expect(accounts.length).to be_positive
      expect(accounts.first.accountName).to be_present
    end
  end

  describe "show" do
    it_behaves_like "sets rate limits", -> { Yext::Api::KnowledgeApi::AccountSettings::Account.find("my-test-account-id-2") }

    it "gets an account" do
      account = Yext::Api::KnowledgeApi::AccountSettings::Account.find("my-test-account-id-2")

      expect(account.accountName).to be_present
    end
  end
end
