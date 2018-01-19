# frozen_string_literal: true

require "rails_helper"

RSpec.describe Yext::Api::Concerns::FaradayConnection do
  class FakeFaradaySpyke < Spyke::Base
  end

  class FakeApiFaradaySpyke < Spyke::Base
  end

  class FakeLiveFaradaySpyke < Spyke::Base
    include Yext::Api::Concerns::FaradayConnection
  end

  around(:each) do |example_proxy|
    configuration = Yext::Api.configuration

    orig_sandbox = configuration.sandbox

    begin
      example_proxy.run
    ensure
      configuration.sandbox = orig_sandbox
    end
  end

  describe "include" do
    it "sets the sandbox connection if sandbox" do
      Yext::Api.configuration.sandbox = true

      expect(Faraday).to receive(:new).with(url: "https://sandbox.yext.com/v2").and_call_original
      expect(FakeFaradaySpyke).to receive(:connection=).with(instance_of(Faraday::Connection)).and_call_original

      FakeFaradaySpyke.include Yext::Api::Concerns::FaradayConnection
    end

    it "sets the api connection if sandbox" do
      Yext::Api.configuration.sandbox = false

      expect(Faraday).to receive(:new).with(url: "https://api.yext.com/v2").and_call_original
      expect(FakeApiFaradaySpyke).to receive(:connection=).with(instance_of(Faraday::Connection)).and_call_original

      FakeApiFaradaySpyke.include Yext::Api::Concerns::FaradayConnection
    end
  end

  describe "live_api" do
    it "sets the live api" do
      Yext::Api.configuration.sandbox = true

      expect(Faraday).to receive(:new).with(url: "https://live.yext.com/v2").and_call_original
      expect(FakeLiveFaradaySpyke).to receive(:connection=).with(instance_of(Faraday::Connection)).and_call_original

      FakeLiveFaradaySpyke.live_api
    end
  end

  describe "faraday_connection" do
    let(:fake_connection) { instance_double(Faraday::Connection, use: nil, request: nil, adapter: nil) }

    before(:each) do
      allow(Faraday).to receive(:new) do |*_args, &block|
        block.call fake_connection
      end
    end

    it "passes in the URL" do
      expect(Faraday).to receive(:new).with(url: "this is not valid").and_return nil

      Yext::Api::Concerns::FaradayConnection.faraday_connection "this is not valid"
    end

    it "sets the request style to json" do
      expect(fake_connection).to receive(:request).with(:json)

      Yext::Api::Concerns::FaradayConnection.faraday_connection "this is not valid"
    end

    it "uses Yext::Api::Utils::ResponseParser" do
      expect(fake_connection).to receive(:use).with(Yext::Api::Utils::ResponseParser)

      Yext::Api::Concerns::FaradayConnection.faraday_connection "this is not valid"
    end

    it "uses Yext::Api::Utils::DefaultParameters" do
      expect(fake_connection).to receive(:use).with(Yext::Api::Utils::DefaultParameters)

      Yext::Api::Concerns::FaradayConnection.faraday_connection "this is not valid"
    end

    it "uses Yext::Api::Utils::ApiRateLimits" do
      expect(fake_connection).to receive(:use).with(Yext::Api::Utils::ApiRateLimits)

      Yext::Api::Concerns::FaradayConnection.faraday_connection "this is not valid"
    end

    it "uses the default adapter" do
      expect(fake_connection).to receive(:adapter).with(Faraday.default_adapter)

      Yext::Api::Concerns::FaradayConnection.faraday_connection "this is not valid"
    end
  end
end
