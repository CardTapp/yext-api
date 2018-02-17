# frozen_string_literal: true

module Yext
  module Api
    module Utils
      # A configuration class for global configurations for interfacing with the Yext API.
      #
      # The class is a Singleton class to simplify accessing the configuration.
      #
      # Documentation for how the various configurations are used within Yext can be found here:
      #   http://developer.yext.com/docs/administrative-api/#section/Policies-and-Conventions
      #
      # Initialization:
      #   Some values within the
      #
      # The configurations:
      #
      # account_id
      #   *required*
      #   default: "me"
      #   The ID of the account which you are interfacing with.
      #
      #   If the default value of "me" is used, the account_id will default to the account which owns the
      #   api_key.
      #
      # api_key
      #   *required*
      #   The API key for the Yext Application which is being used to submit the request through.
      #
      # api_version
      #   The version of the Yext API that the request would like to use for any given API call.
      #
      #   If left as nil, the gem will try to use the most up-to-date known version of all APIs whenever
      #   possible, and future updates will adjust the defaults for each call to the most recent known
      #   version of the API.
      #
      #   To keep your application stable, you should set this value to a static known value (such as
      #   the date the project using the Yext API first started development).
      #
      #   The Yext API will accept a default of "20161012" to use the initially released v2 API.
      #
      # validation_level
      #   The validation level to use for a request.  Yext defaults this to "strict".  You can set this to
      #   "lenient" to allow more lenient error and warning handling on your requests.
      #
      #   Validation should be a value from Yext::Api::Enumerations::Validation
      #
      # yext_username
      #   The username of a Yext User that the call is being made on the behalf of.  This will affect the
      #   logging of who made a change.
      #
      # yext_user_id
      #   The id of a Yext User that the call is being made on the behalf of.  This will affect the
      #   logging of who made a change.
      #
      # sandbox
      #   Boolean that indicates if the gem should use the production or sandbox URL.
      class Configuration
        include Singleton

        attr_accessor :account_id,
                      :api_key,
                      :api_version,
                      :yext_username,
                      :yext_user_id,
                      :sandbox
        attr_reader :validation_level

        def initialize
          read_from_environment_variables
        end

        def validation_level=(value)
          if (value.present? || value == false) &&
              !Yext::Api::Enumerations::Validation.all.include?(value)
            raise ArgumentError, "validation must be one of: #{Yext::Api::Enumerations::Validation.all.join(',')}"
          end

          @validation_level = value
        end

        def param_account_id
          account_id || "me"
        end

        private

        def read_from_environment_variables
          @sandbox = !Rails.env.production?

          @account_id       = ENV["YEXT_ACCOUNT_ID"]
          @api_key          = ENV["YEXT_API_KEY"]
          @api_version      = ENV["YEXT_API_VERSION"]
          @validation_level = ENV["YEXT_VALIDATION_LEVEL"]
          @yext_username    = ENV["YEXT_USERNAME"]
          @yext_user_id     = ENV["YEXT_USER_ID"]
        end
      end
    end
  end
end
