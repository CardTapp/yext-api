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
      #
      # default_callback_processor
      #   The default class to be used to process webhook messages that are called.
      #   The code will warn about any missing webhook messages in a default processor.
      # set_callback_processor(callback_function_name, processor)
      #   The class to be used to process webhook messages for a specific callback.
      #   If the method callback_function_name is not a public instance method for processor, an error
      #   will be raised.
      #
      #   The processor class must be able to be instanciated with the following arguments:
      #     * meta              - a hash of metadata for the webhook
      #     * object            - a Spyke::Base object that represents the object that ws updated or changed
      #                           to cause the hook event.
      #     * language_profiles - (optional) An array of objects.
      #
      #   The functions that can be called for the webhooks are:
      #     * add_request_changed
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

        def default_callback_processor=(value)
          callback_names.each do |callback_name|
            verify_method(value, callback_name)
          end

          callback_processors[:default] = value
        end

        def default_callback_processor
          callback_processors[:default]
        end

        def set_callback_processor(callback_function_name, processor)
          callback_function_name = callback_function_name.downcase.to_sym

          validate_arguments(callback_function_name, processor)

          if processor.present?
            callback_processors[callback_function_name.downcase.to_sym] = processor
          else
            callback_processors.delete(callback_function_name.downcase.to_sym)
          end
        end

        def get_callback_processor(callback_function_name)
          callback_function_name = callback_function_name.downcase.to_sym

          callback_processors.fetch(callback_function_name, callback_processors[:default])
        end

        private

        def validate_arguments(callback_function_name, processor)
          raise ArgumentError, "invalid callback function #{callback_function_name}" unless callback_names.include?(callback_function_name)

          return if verify_method(processor, callback_function_name)

          raise ArgumentError, "#{processor.name} does not have a valid #{callback_function_name} function"
        end

        def callback_processors
          @callback_processors ||= {}
        end

        def callback_names
          %i[add_request_changed].dup
        end

        def verify_method(callback_class, method_name)
          return true if callback_class.blank?
          return true if valid_method_definition?(callback_class, method_name)

          warning_messsage = "The callback_processor does not include a valid #{method_name} method."
          if Object.const_defined?("Rails")
            Rails.logger.warn warning_messsage
          else
            # :nocov:
            puts warning_messsage
            # :nocov:
          end

          false
        end

        def valid_method_definition?(callback_class, method_name)
          return false if callback_class.public_instance_methods.grep(method_name).blank?

          method = callback_class.instance_method(method_name)

          return true if method.parameters.length.zero?

          method.parameters.count { |param_details| %i[keyreq req].include?(param_details.first) }.zero?
        end

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
