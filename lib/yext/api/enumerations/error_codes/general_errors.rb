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

          INVALID_API_KEY                    = 1
          INVALID_CREDENTIALS                = 2
          INVALID_USERNAME_PASSWORD          = 3
          INSUFFICIENT_PRIVILEGES            = 4
          UNABLE_TO_READ_REQUEST             = 5
          CONTENT_TYPE_NOT_ACCEPTED          = 6
          RESOURCE_DOES_NOT_EXIST            = 7
          UNEXPECTED_EXCEPTION               = 8
          SERVER_ERROR                       = 9
          OPERATION_NOT_SUPPORTED            = 10
          NO_VALID_AUTHENTICATION_FOUND      = 11
          EXTERNAL_IDS_NO_SPECIAL_CHARACTERS = 12
          INSUFFICIENT_ACCESS                = 13
          INSUFFICENT_FEATURE_ACCESS         = 14
          UNABLE_TO_DETERMINE_SERIALIZATION  = 15
          PROBLEM_DESERIALIZING              = 16
          UNHANDLED_PROBLEM_DESERIALIZING    = 16
          SERIALIZATION_PLUGIN_EXCEPTION     = 17
          INVALID_IP                         = 18
          ACCOUNT_LOCKED                     = 19
          INSUFFICIENT_APP_ACCESS            = 20
          BAD_PARAMETER                      = 21
          MISSING_REQUIRED_VALUE             = 22
          DOES_NOT_SUPPORT_ALL_MACRO         = 23
          MISSING_REQUEST_BODY               = 24
          INVALID_ACCESS_TOKEN               = 25
          GATEWAY_TIMEOUT                    = 26
          EXCEEDED_QUOTA                     = 42
        end
      end
    end
  end
end
