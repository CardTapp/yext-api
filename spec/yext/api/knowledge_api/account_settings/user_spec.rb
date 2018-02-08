# frozen_string_literal: true

require "rails_helper"

RSpec.describe Yext::Api::KnowledgeApi::AccountSettings::User, :vcr do
  it_behaves_like "default scopes"

  describe "index" do
    it_behaves_like "sets rate limits", -> { Yext::Api::KnowledgeApi::AccountSettings::User.all.to_a }

    it "gets a list of users" do
      users = Yext::Api::KnowledgeApi::AccountSettings::User.all.to_a

      expect(users.length).to be_positive
      expect(users.first.firstName).to be_present
    end
  end

  describe "show" do
    it_behaves_like "sets rate limits",
                    -> { Yext::Api::KnowledgeApi::AccountSettings::User.account("my-test-account-id-2").find("test-user-test-id-1") }

    it "gets a user" do
      user = Yext::Api::KnowledgeApi::AccountSettings::User.account("my-test-account-id-2").find("test-user-test-id-1")

      expect(user.firstName).to be_present
    end
  end

  describe "create" do
    it_behaves_like("sets rate limits", lambda do
      Yext::Api::KnowledgeApi::AccountSettings::User.
          account("my-test-account-id-2").
          create(create_id:    "test-user-test-id-1",
                 firstName:    "Test",
                 lastName:     "User",
                 emailAddress: "automated_test@cardtapp.com",
                 acl:          [{ roleId: "20", onType: "ACCOUNT", on: "my-test-account-id-2", accountId: "my-test-account-id-2" }],
                 password:     "password12")

      user = Yext::Api::KnowledgeApi::AccountSettings::User.account("my-test-account-id-2").find("test-user-test-id-1")

      expect(user.firstName).to be_present
    end)
  end

  describe "update" do
    let(:user) { Yext::Api::KnowledgeApi::AccountSettings::User.account("my-test-account-id-2").find("test-user-test-id-1") }

    after(:each) do
      user.firstName = "Test"
      user.save
    end

    it_behaves_like("sets rate limits", lambda do
      expect(user.firstName).to eq "Test"

      user.firstName = "Changed"
      user.save

      updated_user = Yext::Api::KnowledgeApi::AccountSettings::User.account("my-test-account-id-2").find("test-user-test-id-1")

      expect(updated_user.firstName).to eq "Changed"
    end)
  end

  describe "destroy" do
    it_behaves_like("sets rate limits", lambda do
      users = Yext::Api::KnowledgeApi::AccountSettings::User.account("my-test-account-id-2").all.to_a

      expect(users.count).to eq 1

      user = Yext::Api::KnowledgeApi::AccountSettings::User.
          account("my-test-account-id-2").
          create(create_id:    "test-user-test-id-2",
                 firstName:    "Other",
                 lastName:     "Test",
                 emailAddress: "other_automated_test@cardtapp.com",
                 acl:          [{ roleId: "20", onType: "ACCOUNT", on: "my-test-account-id-2", accountId: "my-test-account-id-2" }],
                 password:     "password12")

      users = Yext::Api::KnowledgeApi::AccountSettings::User.account("my-test-account-id-2").all.to_a

      expect(users.count).to eq 2

      user.destroy

      users = Yext::Api::KnowledgeApi::AccountSettings::User.account("my-test-account-id-2").all.to_a

      expect(users.count).to eq 1
    end)
  end

  describe "change_password!" do
    it_behaves_like("sets rate limits", lambda do
      user = Yext::Api::KnowledgeApi::AccountSettings::User.account("my-test-account-id-2").find("test-user-test-id-1")

      expect { user.change_password!("password12") }.not_to raise_exception

      expect(Yext::Api::KnowledgeApi.last_status).to eq 200
    end)
  end
end
