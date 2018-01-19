# frozen_string_literal: true

require "rails_helper"

RSpec.describe Yext::Api::Concerns::ApiFinder do
  class FakeFinder
    include Yext::Api::Concerns::ApiFinder

    def find(url, method)
      find_api(url, method.to_s)
    end
  end

  let(:finder) { FakeFinder.new }

  RSpec.shared_examples("finds path") do |api_module, object_name, action|
    it "find the modlue #{api_module.name} for #{object_name}.#{action[:action]}" do
      url = action[:endpoint].delete("{")
      url = url.delete("}")

      expect(finder.find(URI.parse(url), action[:method])).to eq api_module
    end
  end

  hash = YAML.load_file(Yext::Api::Engine.root.join("lib/config/api.yml"))

  hash[:administrative_api][:objects].each do |object_name, api_object|
    api_object[:actions].each do |action|
      next if action[:endpoint].blank?

      it_behaves_like("finds path", Yext::Api::AdministrativeApi, object_name, action)
    end
  end

  hash[:knowledge_api].each_value do |sub_group|
    next unless sub_group.is_a?(Hash)

    sub_group[:objects].each do |object_name, api_object|
      api_object[:actions].each do |action|
        next if action[:endpoint].blank?

        it_behaves_like("finds path", Yext::Api::KnowledgeApi, object_name, action)
      end
    end
  end

  it_behaves_like("finds path",
                  Yext::Api::LiveApi,
                  "fake",
                  action:          :show,
                  method:          :get,
                  endpoint:        "https://liveapi.yext.com/v2/accounts/{accountId}/fake/{fakeId}/schema",
                  path_regex:      "https://liveapi.yext.com/v2/accounts/\\w+/locations/\\w+?/schema",
                  default_version: "20161012",
                  documentation:   "http://developer.yext.com/docs/live-api/#operation/getLocationSchema",
                  comment:         "fake comment",
                  sandbox_only:    false)

  it "ignores a path that cannot be found" do
    url = "https://api.yext.com/v2/accounts/accountId/fake/fakeId/fakeschema"

    expect(finder.find(URI.parse(url), :get)).to be_nil
  end

  it "ignores a path with a different method" do
    url = "https://api.yext.com/v2/accounts/accountId/services"

    expect(finder.find(URI.parse(url), :options)).to be_nil
  end
end
