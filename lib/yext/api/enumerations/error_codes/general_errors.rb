# frozen_string_literal: true

module Yext
  module Api
    module Enumerations
      class ErrorCodes
        # General error codes
        # These are errors that can happen across all APIs
        #
        # http://developer.yext.com/docs/error-messages/#general-errors
        module GeneralErrors
          include Yext::Api::Concerns::EnumAll

          INVALID_API_KEY                    = { code:      1,
                                                 http_code: 1,
                                                 message:   "Invalid API Key" }.freeze
          INVALID_CREDENTIALS                = { code:      2,
                                                 http_code: 2,
                                                 message:   "No valid api key or http authentication provided." }.freeze
          INVALID_USERNAME_PASSWORD          = { code:      3,
                                                 http_code: 3,
                                                 message:   "Invalid username/password combination." }.freeze
          INSUFFICIENT_PRIVILEGES            = { code:      4,
                                                 http_code: 4,
                                                 message:   "We're sorry, currently only users with API access permission can " \
                                                                "access this functionality. If you believe you are seeing this " \
                                                                "message in error, please contact support." }.freeze
          UNABLE_TO_READ_REQUEST             = { code:      5,
                                                 http_code: 5,
                                                 message:   "We were unable to read your request." }.freeze
          CONTENT_TYPE_NOT_ACCEPTED          = { code:      6,
                                                 http_code: 6,
                                                 message:   "You have specified that you do not accept {0}.freeze" }.freeze
          RESOURCE_DOES_NOT_EXIST            = { code:      7,
                                                 http_code: 7,
                                                 message:   "This resource does not exist: {0}.freeze Please consult the documentation" }.freeze
          UNEXPECTED_EXCEPTION               = { code:      8,
                                                 http_code: 8,
                                                 message:   "We cannot respond at the moment. Please contact support if this " \
                                                                "problem persists." }.freeze
          SERVER_ERROR                       = { code:      9,
                                                 http_code: 9,
                                                 message:   "We had a problem with our software. Please contact support!" }.freeze
          OPERATION_NOT_SUPPORTED            = { code:      10,
                                                 http_code: 10,
                                                 message:   "Operation not currently supported for your account, please contact support" }.freeze
          NO_VALID_AUTHENTICATION_FOUND      = { code:      11,
                                                 http_code: 11,
                                                 message:   "No valid authentication found" }.freeze
          EXTERNAL_IDS_NO_SPECIAL_CHARACTERS = { code:      12,
                                                 http_code: 12,
                                                 message:   "External ids cannot contain special characters." }.freeze
          INSUFFICIENT_ACCESS                = { code:      13,
                                                 http_code: 13,
                                                 message:   "We're sorry, currently only Yext resellers can access this " \
                                                                "functionality. If you believe you are seeing this message " \
                                                                "in error, please contact support." }.freeze
          INSUFFICENT_FEATURE_ACCESS         = { code:      14,
                                                 http_code: 14,
                                                 message:   "You do not have access to this feature" }.freeze
          UNABLE_TO_DETERMINE_SERIALIZATION  = { code:      15,
                                                 http_code: 15,
                                                 message:   "We were unable to determine the format of your request." }.freeze
          PROBLEM_DESERIALIZING              = { code:      16,
                                                 http_code: 16,
                                                 message:   "Problem deserializing: {0}.freeze" }.freeze
          UNHANDLED_PROBLEM_DESERIALIZING    = { code:      16,
                                                 http_code: 16,
                                                 message:   "Unhandled problem deserializing: {0}.freeze." }.freeze
          SERIALIZATION_PLUGIN_EXCEPTION     = { code:      17,
                                                 http_code: 17,
                                                 message:   "We had an unexpected problem reading your request." }.freeze
          INVALID_IP                         = { code:      18,
                                                 http_code: 18,
                                                 message:   "Invalid IP" }.freeze
          ACCOUNT_LOCKED                     = { code:      19,
                                                 http_code: 19,
                                                 message:   "Your account is locked because your subscriptions are not current." }.freeze
          INSUFFICIENT_APP_ACCESS            = { code:      20,
                                                 http_code: 20,
                                                 message:   "App does not have access to this endpoint" }.freeze
          BAD_PARAMETER                      = { code:      21,
                                                 http_code: 21,
                                                 message:   "Invalid parameter {0}.freeze with value: {1}.freeze" }.freeze
          MISSING_REQUIRED_VALUE             = { code:      22,
                                                 http_code: 22,
                                                 message:   "Missing required value: {0}.freeze" }.freeze
          DOES_NOT_SUPPORT_ALL_MACRO         = { code:      23,
                                                 http_code: 23,
                                                 message:   "This endpoint does not support the \"all\" account ID macro." }.freeze
          MISSING_REQUEST_BODY               = { code:      24,
                                                 http_code: 24,
                                                 message:   "Missing required request body." }.freeze
          INVALID_ACCESS_TOKEN               = { code:      25,
                                                 http_code: 25,
                                                 message:   "Invalid access token" }.freeze
          GATEWAY_TIMEOUT                    = { code:      26,
                                                 http_code: 26,
                                                 message:   "Gateway timeout error" }.freeze
          EXCEEDED_QUOTA                     = { code:      42,
                                                 http_code: 429,
                                                 message:   "You have exceeded your rate limit" }.freeze
        end
      end
    end
  end
end
