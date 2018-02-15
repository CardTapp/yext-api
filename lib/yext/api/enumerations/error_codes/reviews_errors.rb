# frozen_string_literal: true

module Yext
  module Api
    module Enumerations
      class ErrorCodes
        # Reviews error codes
        #
        # http://developer.yext.com/docs/error-messages/#reviews-errors
        module ReviewsErrors
          include Yext::Api::Concerns::EnumAll

          REVIEWS_CANNOT_CREATE_EXTERNAL_REVIEW = 2500
          REVIEWS_INVALID_AUTHOR_EMAIL          = 2501
          REVIEWS_INVALID_RATING_VALUE          = 2502
          REVIEWS_INVALID_STATUS_VALUE          = 2503
          REVIEWS_CANNOT_UPDATE_EXTERNAL_REVIEW = 2504
          REVIEWS_INVALID_LOCATION_ID           = 2505
          REVIEWS_INVALID_DATE_FORMAT           = 2506
        end
      end
    end
  end
end
