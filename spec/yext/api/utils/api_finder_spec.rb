# frozen_string_literal: true

require "rails_helper"

RSpec.describe Yext::Api::Utils::ApiFinder do
  RSpec.shared_examples("finds path") do |api_module, object_name, action|
    it "find the modlue #{api_module.name} for #{object_name}.#{action[:action]}" do
      url = action[:endpoint].delete("{")
      url = url.delete("}")

      expect(Yext::Api::Utils::ApiFinder.new(URI.parse(url), action[:method]).find_api).to eq api_module
    end

    it "find the class #{api_module.name}::#{object_name} for #{action[:action]}" do
      url = action[:endpoint].delete("{")
      url = url.delete("}")

      expect(Yext::Api::Utils::ApiFinder.new(URI.parse(url), action[:method]).find_class_name).
          to eq "#{api_module.name}::#{object_name}"
    end
  end

  hash = YAML.load_file(Yext::Api::Engine.root.join("lib/config/api.yml"))

  describe Yext::Api::AdministrativeApi do
    hash[:administrative_api][:objects].each do |object_name, api_object|
      api_object[:actions].each do |action|
        next if action[:endpoint].blank?

        it_behaves_like("finds path", Yext::Api::AdministrativeApi, object_name.to_s.classify, action)
      end
    end
  end

  describe Yext::Api::LiveApi do
    hash[:live_api][:objects].each do |object_name, api_object|
      api_object[:actions].each do |action|
        next if action[:endpoint].blank?

        it_behaves_like("finds path", Yext::Api::LiveApi, object_name.to_s.classify, action)
      end
    end
  end

  describe Yext::Api::KnowledgeApi do
    hash[:knowledge_api].each do |sub_group_name, sub_group|
      next unless sub_group.is_a?(Hash)

      describe sub_group_name.to_s.classify do
        sub_group[:objects].each do |object_name, api_object|
          api_object[:actions].each do |action|
            next if action[:endpoint].blank?

            it_behaves_like("finds path", Yext::Api::KnowledgeApi, "#{sub_group_name.to_s.classify}::#{object_name.to_s.classify}", action)
          end
        end
      end
    end
  end

  describe "negative tests" do
    it "does not find an API for a bad path" do
      url = "https://api.yext.com/v2/accounts/accountId/fake/fakeId/fakeschema"

      expect(Yext::Api::Utils::ApiFinder.new(URI.parse(url), :get).find_api).to be_nil
    end

    it "does not find a class for a bad path" do
      url = "https://api.yext.com/v2/accounts/accountId/fake/fakeId/fakeschema"

      expect(Yext::Api::Utils::ApiFinder.new(URI.parse(url), :get).find_class_name).to be_nil
    end

    it "does not find an API for a path with a different method" do
      url = "https://api.yext.com/v2/accounts/accountId/services"

      expect(Yext::Api::Utils::ApiFinder.new(URI.parse(url), :options).find_api).to be_nil
    end

    it "does not find an API for a path with a different method" do
      url = "https://api.yext.com/v2/accounts/accountId/services"

      expect(Yext::Api::Utils::ApiFinder.new(URI.parse(url), :options).find_class_name).to be_nil
    end
  end
end
