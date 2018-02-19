# frozen_string_literal: true

require "rails_helper"

RSpec.describe Yext::Api::Validators::AccountValidator do
  describe "valid?" do
    it "validates an account" do
      validator = Yext::Api::Validators::AccountValidator.new(Yext::Api::AdministrativeApi::Account.new(accountId: "Account ID", something: "here"))

      expect(validator).to be_valid
    end

    it "validates an account with no id" do
      account   = Yext::Api::AdministrativeApi::Account.new(something: "here")
      validator = Yext::Api::Validators::AccountValidator.new(account)

      expect(validator).not_to be_valid
      expect { account.accountId }.to raise_error NoMethodError
    end
  end
end
