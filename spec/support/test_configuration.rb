# frozen_string_literal: true

Yext::Api.configure do |configuration|
  configuration.account_id  ||= "test_fake_account_id"
  configuration.api_key     ||= "fake_api_key"
  configuration.api_version ||= "20161012"
end
