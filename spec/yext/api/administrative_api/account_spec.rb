# frozen_string_literal: true

require "rails_helper"

RSpec.describe Yext::Api::AdministrativeApi::Account, :vcr do
  it_behaves_like "default scopes"

  describe "index" do
    # The AdministrativeApi rate limits are not set for this call, instead the KnowledgeApi rates are.
    # it_behaves_like "sets rate limits", -> { Yext::Api::AdministrativeApi::Account.all.to_a }

    it "sets the KnowledgeApi rate limit" do
      [Yext::Api::LiveApi, Yext::Api::KnowledgeApi, Yext::Api::AdministrativeApi].each do |rate_module|
        rate_module.send(:update_rates, remaining: 0, limit: 0, reset_at: nil)
      end

      Yext::Api::AdministrativeApi::Account.all.to_a

      expect(Yext::Api::KnowledgeApi.rate_limit_limit).to be > 0
      expect(Yext::Api::KnowledgeApi.rate_limit_remaining).to be > 0
      expect(Yext::Api::KnowledgeApi.rate_limit_reset_at).to be

      [Yext::Api::AdministrativeApi, Yext::Api::LiveApi].each do |other_module|
        expect(other_module.rate_limit_limit).to eq 0
        expect(other_module.rate_limit_remaining).to eq 0
        expect(other_module.rate_limit_reset_at).not_to be
      end
    end

    it "gets a list of accounts" do
      accounts = Yext::Api::AdministrativeApi::Account.all.to_a

      expect(accounts.length).to be_positive
      expect(accounts.first.accountName).to be_present
    end
  end

  describe "show" do
    # The AdministrativeApi rate limits are not set for this call, instead the KnowledgeApi rates are.
    # it_behaves_like "sets rate limits", -> { Yext::Api::AdministrativeApi::Account.find("ct-dustin") }

    it "sets the KnowledgeApi rate limit" do
      [Yext::Api::LiveApi, Yext::Api::KnowledgeApi, Yext::Api::AdministrativeApi].each do |rate_module|
        rate_module.send(:update_rates, remaining: 0, limit: 0, reset_at: nil)
      end

      Yext::Api::AdministrativeApi::Account.find("ct-dustin")

      expect(Yext::Api::KnowledgeApi.rate_limit_limit).to be > 0
      expect(Yext::Api::KnowledgeApi.rate_limit_remaining).to be > 0
      expect(Yext::Api::KnowledgeApi.rate_limit_reset_at).to be

      [Yext::Api::AdministrativeApi, Yext::Api::LiveApi].each do |other_module|
        expect(other_module.rate_limit_limit).to eq 0
        expect(other_module.rate_limit_remaining).to eq 0
        expect(other_module.rate_limit_reset_at).not_to be
      end
    end

    it "gets an account" do
      account = Yext::Api::AdministrativeApi::Account.find("ct-dustin")

      expect(account.accountName).to be_present
    end
  end

  # This test uses a previously created and completed account from the AddRequest tests.
  describe "update" do
    let(:account) { Yext::Api::AdministrativeApi::Account.find("my-test-account-id-2") }

    after(:each) do
      account.accountId   = "my-test-account-id-2"
      account.accountName = "RSpec Test Account 2"

      account.save
    end

    it "does not update the id" do
      account.accountId = "my-changed-test-account-id-2"

      expect(account.account_id).to eq "my-test-account-id-2"

      account.save

      expect(account.account_id).to eq "my-changed-test-account-id-2"
      expect(Yext::Api::AdministrativeApi.last_status).to eq 400
    end

    it "udpates the name" do
      account.accountName = "RSpec Changed Test Account 2"

      expect(account.account_id).to eq "my-test-account-id-2"

      account.save
      expect(Yext::Api::AdministrativeApi.last_status).to eq 200

      updated_account = Yext::Api::AdministrativeApi::Account.find("my-test-account-id-2")
      expect(updated_account.accountName).to eq "RSpec Changed Test Account 2"
    end
  end
end
