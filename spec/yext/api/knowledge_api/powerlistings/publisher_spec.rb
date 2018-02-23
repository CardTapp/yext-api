# frozen_string_literal: true

require "rails_helper"

RSpec.describe Yext::Api::KnowledgeApi::Powerlistings::Publisher, :vcr do
  it_behaves_like "default scopes"

  describe "index" do
    it_behaves_like("sets rate limits", -> { Yext::Api::KnowledgeApi::Powerlistings::Publisher.account("my-test-account-id-2").get })

    it "gets a list of publishers" do
      publishers = Yext::Api::KnowledgeApi::Powerlistings::Publisher.account("my-test-account-id-2").get

      expect(publishers.count).to be_positive
      expect(publishers.first.name).to be
    end
  end
end
