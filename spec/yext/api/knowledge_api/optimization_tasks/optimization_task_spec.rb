# frozen_string_literal: true

require "rails_helper"

RSpec.describe Yext::Api::KnowledgeApi::OptimizationTasks::OptimizationTask, :vcr do
  it_behaves_like "default scopes"

  describe "index" do
    it_behaves_like("sets rate limits", lambda do
      Yext::Api::KnowledgeApi::OptimizationTasks::OptimizationTask.
          account("my-test-account-id-2").
          location("my-test-location-id-2").
          all.
          to_a
    end)

    it "gets a list of tasks" do
      tasks = Yext::Api::KnowledgeApi::OptimizationTasks::OptimizationTask.
          account("my-test-account-id-2").
          location("my-test-location-id-2").
          all.
          to_a

      expect(tasks.length).to be > 1
      expect(tasks.first.name).to be
    end

    it "gets a link for multiple locations" do
      tasks = Yext::Api::KnowledgeApi::OptimizationTasks::OptimizationTask.
          account("my-test-account-id-2").
          locations("my-test-location-id-2", "my-test-location-id-3").
          all.
          to_a

      pending "I don't have 2 locations to test with yet."

      expect(tasks.length).to be > 1
      expect(tasks.first.name).to be
    end

    it "gets a specific task" do
      tasks = Yext::Api::KnowledgeApi::OptimizationTasks::OptimizationTask.
          account("my-test-account-id-2").
          task(1).
          all.
          to_a

      expect(tasks.length).to eq 1
      expect(tasks.first.name).to be
    end

    it "gets a list of specific tasks" do
      tasks = Yext::Api::KnowledgeApi::OptimizationTasks::OptimizationTask.
          account("my-test-account-id-2").
          tasks(1, 2, 3, 4).
          all.
          to_a

      expect(tasks.length).to eq 4
      expect(tasks.first.name).to be
    end
  end
end
