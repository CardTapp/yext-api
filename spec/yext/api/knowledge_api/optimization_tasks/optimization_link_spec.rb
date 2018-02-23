# frozen_string_literal: true

require "rails_helper"

# TODO: complete tests
RSpec.describe Yext::Api::KnowledgeApi::OptimizationTasks::OptimizationLink, :vcr do
  it_behaves_like "default scopes"

  describe "show" do
    it_behaves_like("sets rate limits", lambda do
      Yext::Api::KnowledgeApi::OptimizationTasks::OptimizationLink.
          account("my-test-account-id-2").
          location("my-test-location-id-2").
          get
    end)

    it "gets a link" do
      link = Yext::Api::KnowledgeApi::OptimizationTasks::OptimizationLink.
          account("my-test-account-id-2").
          location("my-test-location-id-2").
          get

      expect(link.link).to be
    end

    it "gets a link for a specific task" do
      link = Yext::Api::KnowledgeApi::OptimizationTasks::OptimizationLink.
          account("my-test-account-id-2").
          location("my-test-location-id-2").
          task(1).
          get

      expect(link.link).to be
    end

    it "gets a link for a set of tasks" do
      link = Yext::Api::KnowledgeApi::OptimizationTasks::OptimizationLink.
          account("my-test-account-id-2").
          location("my-test-location-id-2").
          tasks(1, 2, 3, 4).
          get

      expect(link.link).to be
    end

    it "gets a link for a set of tasks with a particular mode" do
      link = Yext::Api::KnowledgeApi::OptimizationTasks::OptimizationLink.
          account("my-test-account-id-2").
          location("my-test-location-id-2").
          mode(Yext::Api::Enumerations::OptimizationLinkMode::PENDING_ONLY).
          get

      expect(link.link).to be
    end
  end
end
