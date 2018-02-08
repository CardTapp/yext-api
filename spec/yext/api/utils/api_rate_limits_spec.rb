# frozen_string_literal: true

require "rails_helper"

RSpec.describe Yext::Api::Utils::Middleware::ApiRateLimits do
  let(:limit) { rand(1_000..2_000) }
  let(:remaining) { rand(1_000..2_000) }
  let(:reset_at) { rand(1_000..2_000).seconds.from_now }
  let(:env) { Hashie::Mash.new(response: {}) }
  let(:response_environment) do
    { response_headers: { "rate-limit-limit"     => limit,
                          "rate-limit-remaining" => remaining,
                          "rate-limit-reset"     => reset_at } }
  end
  let(:rate_limits) { Yext::Api::Utils::Middleware::ApiRateLimits.new }

  all_modules = [Yext::Api::LiveApi, Yext::Api::KnowledgeApi, Yext::Api::AdministrativeApi]

  before(:each) do
    all_modules.each do |rate_module|
      rate_module.send(:update_rates, remaining: 0, limit: 0, reset_at: nil)
    end

    fake_response = instance_double(Faraday::Response)
    fake_app      = instance_double(Faraday::Adapter::NetHttp, call: fake_response)

    allow(fake_response).to receive(:on_complete).and_yield(response_environment)

    rate_limits.instance_variable_set(:@app, fake_app)
  end

  RSpec.shared_examples("finds rate limit") do |api_module, object_name, action|
    it "sets the #{api_module.name} rate limits for #{object_name}.#{action[:action]}" do
      url = action[:endpoint].delete("{")
      url = url.delete("}")

      env[:url]    = URI.parse(url)
      env[:method] = action[:method]

      rate_limits.call(env)

      expect(api_module.rate_limit_limit).to eq limit
      expect(api_module.rate_limit_remaining).to eq remaining
      expect(api_module.rate_limit_reset_at).to be_within(1.second).of(reset_at)

      (all_modules - [api_module]).each do |not_module|
        expect(not_module.rate_limit_limit).to eq 0
        expect(not_module.rate_limit_remaining).to eq 0
        expect(not_module.rate_limit_reset_at).to be_nil
      end
    end

    it "does not change the #{api_module.name} rate limits for #{object_name}.#{action[:action]} if the header is missing" do
      api_module.send(:update_rates, limit: limit, remaining: remaining, reset_at: reset_at)

      response_environment[:response_headers] = {}

      url = action[:endpoint].delete("{")
      url = url.delete("}")

      env[:url]    = URI.parse(url)
      env[:method] = action[:method]

      rate_limits.call(env)

      expect(api_module.rate_limit_limit).to eq limit
      expect(api_module.rate_limit_remaining).to eq remaining
      expect(api_module.rate_limit_reset_at).to be_within(1.second).of(reset_at)

      (all_modules - [api_module]).each do |not_module|
        expect(not_module.rate_limit_limit).to eq 0
        expect(not_module.rate_limit_remaining).to eq 0
        expect(not_module.rate_limit_reset_at).to be_nil
      end
    end
  end

  hash = YAML.load_file(Yext::Api::Engine.root.join("lib/config/api.yml"))

  hash[:administrative_api][:objects].each do |object_name, api_object|
    api_object[:actions].each do |action|
      next if action[:endpoint].blank?

      it_behaves_like("finds rate limit", Yext::Api::AdministrativeApi, object_name, action)
    end
  end

  hash[:knowledge_api].each_value do |sub_group|
    next unless sub_group.is_a?(Hash)

    sub_group[:objects].each do |object_name, api_object|
      api_object[:actions].each do |action|
        next if action[:endpoint].blank?

        it_behaves_like("finds rate limit", Yext::Api::KnowledgeApi, object_name, action)
      end
    end
  end

  it "ignores a path that cannot be found" do
    url = "https://api.yext.com/v2/accounts/accountId/fake/fakeId/fakeschema"

    env[:url]    = URI.parse(url)
    env[:method] = :get

    rate_limits.call(env)

    all_modules.each do |not_module|
      expect(not_module.rate_limit_limit).to eq 0
      expect(not_module.rate_limit_remaining).to eq 0
      expect(not_module.rate_limit_reset_at).to be_nil
    end
  end

  it "ignores a path with a different method" do
    url = "https://api.yext.com/v2/accounts/accountId/services"

    env[:url]    = URI.parse(url)
    env[:method] = :options

    rate_limits.call(env)

    all_modules.each do |not_module|
      expect(not_module.rate_limit_limit).to eq 0
      expect(not_module.rate_limit_remaining).to eq 0
      expect(not_module.rate_limit_reset_at).to be_nil
    end
  end
end
