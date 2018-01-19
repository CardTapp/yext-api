# frozen_string_literal: true

require "rails_helper"

RSpec.describe Yext::Api::Utils::DefaultParameters do
  let(:default_parameters) { Yext::Api::Utils::DefaultParameters.new }
  let(:request_environment) do
    { url:             URI.parse("https://api.yext.com/v2/accounts/accountId/services"),
      method:          "get",
      request_headers: {} }
  end

  all_methods = %w[put patch get create delete options]

  before(:each) do
    fake_app = instance_double(Faraday::Adapter::NetHttp, call: nil)

    default_parameters.instance_variable_set(:@app, fake_app)
  end

  around(:each) do |example_proxy|
    configuration = Yext::Api.configuration

    orig_account_id       = configuration.account_id
    orig_api_key          = configuration.api_key
    orig_api_version      = configuration.api_version
    orig_yext_username    = configuration.yext_username
    orig_yext_user_id     = configuration.yext_user_id
    orig_sandbox          = configuration.sandbox
    orig_validation_level = configuration.validation_level

    begin
      example_proxy.run
    ensure
      configuration.account_id       = orig_account_id
      configuration.api_key          = orig_api_key
      configuration.api_version      = orig_api_version
      configuration.yext_username    = orig_yext_username
      configuration.yext_user_id     = orig_yext_user_id
      configuration.sandbox          = orig_sandbox
      configuration.validation_level = orig_validation_level
    end
  end

  describe "header values" do
    RSpec.shared_examples "sets username" do |header_param, query_param, request_method|
      context request_method do
        before(:each) do
          request_environment[:method] = request_method
        end

        it "uses and removes a value passed in as a parameter" do
          request_environment[:url] = URI.parse("https://api.yext.com/v2/accounts/accountId/services?#{query_param}=my+yext%20username")

          default_parameters.call(request_environment)

          expect(request_environment[:url].query).not_to be_include(query_param)
          expect(request_environment[:request_headers][header_param]).to eq "my yext username"
        end

        it "uses the configuration value as a default" do
          default_parameters.call(request_environment)

          expect(request_environment[:url].query).not_to be_include(query_param)
          expect(request_environment[:request_headers][header_param]).to eq "my config yext username"
        end
      end
    end

    RSpec.shared_examples "sets header value" do |header_param, query_param|
      before(:each) do
        request_environment[:method] = "get"
        Yext::Api.configuration.send("#{query_param}=", "my config yext username")
      end

      describe header_param do
        it_behaves_like "sets username", header_param, query_param, "post"
        it_behaves_like "sets username", header_param, query_param, "put"
        it_behaves_like "sets username", header_param, query_param, "patch"
        it_behaves_like "sets username", header_param, query_param, "delete"

        context("get") do
          before(:each) do
            request_environment[:method] = "get"
          end

          it "does not use but removes a value passed in as a parameter for a get" do
            request_environment[:url] = URI.parse("https://api.yext.com/v2/accounts/accountId/services?#{query_param}=my+yext%20username")

            default_parameters.call(request_environment)

            expect(request_environment[:url].query).not_to be_include(query_param)
            expect(request_environment[:request_headers]).not_to be_key(header_param)
          end

          it "does not use the configuration value for a get" do
            default_parameters.call(request_environment)

            expect(request_environment[:url].query).not_to be_include(query_param)
            expect(request_environment[:request_headers]).not_to be_key(header_param)
          end
        end
      end
    end

    it_behaves_like "sets header value", "Yext-Username", "yext_username"
    it_behaves_like "sets header value", "Yext-User-Id", "yext_user_id"
  end

  describe "query values" do
    RSpec.shared_examples "sets defaulted parameter" do |method, config_name, query_param|
      before(:each) do
        request_environment[:method] = method
        Yext::Api.configuration.send("#{config_name}=", "my configuration yext username")
      end

      it "uses the value in the parameter" do
        request_environment[:url] = URI.parse("https://api.yext.com/v2/accounts/accountId/services?#{query_param}=my+yext%20username")

        default_parameters.call(request_environment)

        expect(request_environment[:url].query).to be_include("#{query_param}=my+yext+username")
      end

      it "defaults to the value in the configuration" do
        default_parameters.call(request_environment)

        expect(request_environment[:url].query).to be_include("#{query_param}=my+configuration+yext+username")
      end
    end

    RSpec.shared_examples "sets default params" do |config_name, query_param|
      all_methods.each do |method|
        it_behaves_like "sets defaulted parameter", method, config_name, query_param
      end
    end
  end

  describe "validation" do
    it_behaves_like "sets default params", "api_key", "api_key"
    it_behaves_like "sets default params", "api_version", "v"

    it "defaults v if it is nil" do
      Yext::Api.configuration.api_version = nil

      default_parameters.call(request_environment)

      expect(request_environment[:url].query).to be_include("v=20161012")
    end

    RSpec.shared_examples "sets validation" do |method|
      before(:each) do
        request_environment[:method]             = method
        Yext::Api.configuration.validation_level = Yext::Api::Enumerations::Validation::STRICT
      end

      it "doesn't set version if the configuration isn't set" do
        Yext::Api.configuration.validation_level = nil

        default_parameters.call(request_environment)

        expect(request_environment[:url].query).not_to be_include("validation=")
      end

      it "uses the query value" do
        request_environment[:url] = URI.parse("https://api.yext.com/v2/accounts/accountId/services?validation=lenient")

        default_parameters.call(request_environment)

        expect(request_environment[:url].query).to be_include("validation=lenient")
      end

      it "uses the configuration value if it is set" do
        default_parameters.call(request_environment)

        expect(request_environment[:url].query).to be_include("validation=strict")
      end
    end

    all_methods.each do |method|
      it_behaves_like "sets validation", method
    end
  end

  describe "route" do
    let(:account_path) { Yext::Api::Concerns::Account.account_path("/services") }

    before(:each) do
      Yext::Api.configuration.account_id = "configured_fake_id"
    end

    it "inserts the configured ID if no account_id" do
      account_path.gsub!("(:account_id)", "")
      request_environment[:url] = URI.parse("https://api.yext.com/v2/#{account_path}")

      default_parameters.call(request_environment)

      expect(request_environment[:url].path).to be_include("accounts/configured_fake_id")
    end

    it "uses me if no account_id and no configured account_id" do
      Yext::Api.configuration.account_id = nil

      account_path.gsub!("(:account_id)", "")
      request_environment[:url] = URI.parse("https://api.yext.com/v2/#{account_path}")

      default_parameters.call(request_environment)

      expect(request_environment[:url].path).to be_include("accounts/me")
    end

    it "uses the existing account_id" do
      account_path.gsub!("(:account_id)", "param_account_id")
      request_environment[:url] = URI.parse("https://api.yext.com/v2/#{account_path}")

      default_parameters.call(request_environment)

      expect(request_environment[:url].path).to be_include("accounts/param_account_id")
    end

    it "does nothing if the URL does not have an account" do
      request_environment[:url] = URI.parse("https://api.yext.com/v2/some/path/nowhere")

      default_parameters.call(request_environment)

      expect(request_environment[:url].path).to eq "/v2/some/path/nowhere"
    end

    it "does nothing if the URL does not have an account id" do
      request_environment[:url] = URI.parse("https://api.yext.com/v2/accounts")

      default_parameters.call(request_environment)

      expect(request_environment[:url].path).to eq "/v2/accounts"
    end
  end
end
