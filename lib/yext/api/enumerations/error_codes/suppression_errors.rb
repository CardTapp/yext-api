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

          INVALID_SUPPRESSION_TYPE             = 7500
          INVALID_SUPPRESSION_STATUS           = 7501
          SUPPRESSION_CUSTOMER_ID_REQUIRED     = 7502
          SUPPRESSION_LISTING_ID_REQUIRED      = 7503
          SUPPRESSION_STATUS_REQUIRED          = 7504
          DUPLICATES_OVER_LIMIT                = 7505
          DUPLICATES_LIST_BAD_STATUS           = 7506
          DUPLICATES_UNEXPECTED_ERROR          = 7507
          DUPLICATES_LOCATION_ID_REQUIRED      = 7508
          DUPLICATES_PUBLISHER_ID_REQUIRED     = 7509
          DUPLICATES_LISTING_URL_REQUIRED      = 7510
          DUPLICATES_INVALID_LISTING_URL       = 7511
          DUPLICATES_NO_USER_PROVIDED          = 7512
          DUPLICATES_BAD_ID                    = 7513
          DUPLICATES_ID_NOT_FOUND              = 7514
          DUPLICATES_ID_NOT_IN_BUSINESS        = 7514
          DUPLICATES_DELETE_DUPLICATE_FAILED   = 7515
          DUPLICATES_SUPPRESS_DUPLICATE_FAILED = 7516
        end
      end
    end
  end
end
