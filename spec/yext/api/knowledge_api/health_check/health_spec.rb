# frozen_string_literal: true

require "rails_helper"

RSpec.describe Yext::Api::KnowledgeApi::HealthCheck::Health, :vcr do
  it_behaves_like "default scopes"

  describe "index" do
    # Health does not count against rate limits so it does not return any rate limit information.
    # it_behaves_like "sets rate limits", -> { Yext::Api::KnowledgeApi::HealthCheck::Health.all.to_a }

    it "gets a list of health" do
      health = Yext::Api::KnowledgeApi::HealthCheck::Health.all.to_a

      expect(health.length).to be_positive
      expect(health.first.response_string).to eq "ok"
    end
  end
end
