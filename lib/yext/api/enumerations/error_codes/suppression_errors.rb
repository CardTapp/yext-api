# frozen_string_literal: true

module Yext
  module Api
    module Enumerations
      class ErrorCodes
        # Suppression error codes
        #
        # http://developer.yext.com/docs/error-messages/#suppression-errors
        module SuppressionErrors
          include Yext::Api::Concerns::EnumAll

          INVALID_SUPPRESSION_TYPE             = { code:      7500,
                                                   http_code: 400,
                                                   message:   "suppression type [suppressionType] is invalid" }.freeze
          INVALID_SUPPRESSION_STATUS           = { code:      7501,
                                                   http_code: 400,
                                                   message:   "status is invalid" }.freeze
          SUPPRESSION_CUSTOMER_ID_REQUIRED     = { code:      7502,
                                                   http_code: 400,
                                                   message:   "customerId is required" }.freeze
          SUPPRESSION_LISTING_ID_REQUIRED      = { code:      7503,
                                                   http_code: 400,
                                                   message:   "suppressedListingId is required" }.freeze
          SUPPRESSION_STATUS_REQUIRED          = { code:      7504,
                                                   http_code: 400,
                                                   message:   "status is required" }.freeze
          DUPLICATES_OVER_LIMIT                = { code:      7505,
                                                   http_code: 400,
                                                   message:   "Too many duplicates requested: maximum 50 supported" }.freeze
          DUPLICATES_LIST_BAD_STATUS           = { code:      7506,
                                                   http_code: 400,
                                                   message:   "Bad status" }.freeze
          DUPLICATES_UNEXPECTED_ERROR          = { code:      7507,
                                                   http_code: 500,
                                                   message:   "Unexpected error while fetching duplicates" }.freeze
          DUPLICATES_LOCATION_ID_REQUIRED      = { code:      7508,
                                                   http_code: 400,
                                                   message:   "Location id is required" }.freeze
          DUPLICATES_PUBLISHER_ID_REQUIRED     = { code:      7509,
                                                   http_code: 400,
                                                   message:   "Publisher id is required" }.freeze
          DUPLICATES_LISTING_URL_REQUIRED      = { code:      7510,
                                                   http_code: 400,
                                                   message:   "Url of the duplicate listing is required" }.freeze
          DUPLICATES_INVALID_LISTING_URL       = { code:      7511,
                                                   http_code: 400,
                                                   message:   "Url is invalid" }.freeze
          DUPLICATES_NO_USER_PROVIDED          = { code:      7512,
                                                   http_code: 400,
                                                   message:   "Must set either the Yext-Username or Yext-User-Id header" }.freeze
          DUPLICATES_BAD_ID                    = { code:      7513,
                                                   http_code: 400,
                                                   message:   "Bad duplicate id" }.freeze
          DUPLICATES_ID_NOT_FOUND              = { code:      7514,
                                                   http_code: 400,
                                                   message:   "No duplicates exist with that id" }.freeze
          DUPLICATES_ID_NOT_IN_BUSINESS        = { code:      7514,
                                                   http_code: 400,
                                                   message:   "Duplicate id is not in this business" }.freeze
          DUPLICATES_DELETE_DUPLICATE_FAILED   = { code:      7515,
                                                   http_code: 500,
                                                   message:   "Error deleting duplicate" }.freeze
          DUPLICATES_SUPPRESS_DUPLICATE_FAILED = { code:      7516,
                                                   http_code: 500,
                                                   message:   "Error suppressing duplicate" }.freeze
        end
      end
    end
  end
end
