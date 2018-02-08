# frozen_string_literal: true

require "rails_helper"

RSpec.describe Yext::Api::Utils::Middleware::UriCleanup do
  let(:env) { Hashie::Mash.new(response: {}, url: "url", method: "method") }
  let(:response_environment) { {} }
  let(:fake_finder) { instance_double(Yext::Api::Utils::ApiFinder, find_class_name: nil) }
  let(:uri_cleanup) { Yext::Api::Utils::Middleware::UriCleanup.new }

  before(:each) do
    fake_response = instance_double(Faraday::Response)
    fake_app      = instance_double(Faraday::Adapter::NetHttp, call: fake_response)

    allow(Yext::Api::Utils::ApiFinder).to receive(:new).with("url", "method").and_return fake_finder
    allow(fake_response).to receive(:on_complete).and_yield(response_environment)

    uri_cleanup.instance_variable_set(:@app, fake_app)
  end

  describe "call" do
    it "ignores classes that cannot be found" do
      expect { uri_cleanup.call(env) }.not_to raise_error
    end

    it "logs an error if the class cannot be constantized" do
      expect(fake_finder).to receive(:find_class_name).and_return "fake class name"
      expect(Rails).to receive(:logger).and_call_original

      uri_cleanup.call(env)
    end

    it "it calls reset_ui on the class" do
      expect(fake_finder).to receive(:find_class_name).and_return "Yext::Api::AdministrativeApi::Service"
      expect(Yext::Api::AdministrativeApi::Service).to receive(:reset_uri)

      uri_cleanup.call(env)
    end

    it "ignores the class if it does not have reset_ui" do
      expect(fake_finder).to receive(:find_class_name).and_return "Hash"
      expect(Rails).not_to receive(:logger)

      uri_cleanup.call(env)
    end
  end
end
