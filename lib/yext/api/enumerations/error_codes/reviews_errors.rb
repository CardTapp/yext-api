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

          REVIEWS_CANNOT_CREATE_EXTERNAL_REVIEW = { code:      2500,
                                                    http_code: 500,
                                                    message:   "Cannot create external review" }.freeze
          REVIEWS_INVALID_AUTHOR_EMAIL          = { code:      2501,
                                                    http_code: 400,
                                                    message:   "The authorEmail value is invalid" }.freeze
          REVIEWS_INVALID_RATING_VALUE          = { code:      2502,
                                                    http_code: 400,
                                                    message:   "The rating value must be between 1 and 5" }.freeze
          REVIEWS_INVALID_STATUS_VALUE          = { code:      2503,
                                                    http_code: 400,
                                                    message:   "Status must either be QUARANTINED or LIVE" }.freeze
          REVIEWS_CANNOT_UPDATE_EXTERNAL_REVIEW = { code:      2504,
                                                    http_code: 500,
                                                    message:   "Cannot update external review" }.freeze
          REVIEWS_INVALID_LOCATION_ID           = { code:      2505,
                                                    http_code: 400,
                                                    message:   "The provided location ID is not valid for this business" }.freeze
          REVIEWS_INVALID_DATE_FORMAT           = { code:      2506,
                                                    http_code: 400,
                                                    message:   "Invalid date value {0}.freeze for field {1}.freeze" }.freeze
        end
      end
    end
  end
end
