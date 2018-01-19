# frozen_string_literal: true

require "rails_helper"

RSpec.describe Yext::Api::KnowledgeApi::KnowledgeManager::Category, :vcr do
  it_behaves_like "default scopes"

  describe "index" do
    it_behaves_like "sets rate limits", -> { Yext::Api::KnowledgeApi::KnowledgeManager::Category.all.to_a }

    it "gets a list of categories" do
      categories = Yext::Api::KnowledgeApi::KnowledgeManager::Category.all.to_a

      expect(categories.length).to be_positive
      expect(categories.first.name).to be_present
    end
  end
end
