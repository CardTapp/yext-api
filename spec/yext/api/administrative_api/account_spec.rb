# frozen_string_literal: true

require "rails_helper"

RSpec.describe Yext::Api::AdministrativeApi::Account, :vcr do
  it_behaves_like "default scopes"

  describe "index" do
    # The AdministrativeApi rate limits are not set for this call, instead the KnowledgeApi rates are.
    # it_behaves_like "sets rate limits", -> { Yext::Api::AdministrativeApi::Account.all.to_a }

    it "sets the KnowledgeApi rate limit" do
      [Yext::Api::LiveApi, Yext::Api::KnowledgeApi, Yext::Api::AdministrativeApi].each do |rate_module|
        rate_module.update_rates(remaining: 0, limit: 0, reset_at: nil)
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
        rate_module.update_rates(remaining: 0, limit: 0, reset_at: nil)
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

  describe "create" do
    xit "creates an account"
  end

  describe "add_services" do
  end

  describe "change_status" do
  end

  describe "update" do
  end
end
