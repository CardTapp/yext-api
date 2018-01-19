# frozen_string_literal: true

VCR.configure do |config|
  yext_configuration = Yext::Api.configuration

  config.cassette_library_dir = "spec/cassettes"
  config.hook_into :webmock, :faraday

  ignore_account = ->(left_request, right_request) { IgnoreAccountMatcher.new(left_request, right_request).call }

  config.default_cassette_options = { record:            yext_configuration.api_key.blank? ? :none : :new_episodes,
                                      match_requests_on: [:method,
                                                          ignore_account] }

  # config.debug_logger = File.open(Yext::Api::Engine.root.join("spec/dummy/log/vcr_log.log"), "w")
  # config.ignore_localhost                        = true
  # config.ignore_hosts "chromedriver.storage.googleapis.com"
  config.configure_rspec_metadata!
  config.allow_http_connections_when_no_cassette = false

  config.filter_sensitive_data("fake_account_id") { yext_configuration.account_id }
  config.filter_sensitive_data("fake_api_key") { yext_configuration.api_key }
  config.filter_sensitive_data("fake_yext_username") { yext_configuration.yext_username }
  config.filter_sensitive_data("fake_yext_user_id") { yext_configuration.yext_user_id }
end
