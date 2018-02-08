# frozen_string_literal: true

require "rails_helper"

RSpec.describe Yext::Api::KnowledgeApi::AccountSettings::Role, :vcr do
  it_behaves_like "default scopes"

  describe "index" do
    it_behaves_like "sets rate limits", -> { Yext::Api::KnowledgeApi::AccountSettings::Role.all.to_a }

    it "gets a list of roles" do
      roles = Yext::Api::KnowledgeApi::AccountSettings::Role.all.to_a

      expect(roles.length).to be_positive
      expect(roles.first.name).to be_present
    end
  end
end
