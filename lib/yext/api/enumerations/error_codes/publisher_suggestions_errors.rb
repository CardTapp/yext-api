# frozen_string_literal: true

module Yext
  module Api
    module Enumerations
      class ErrorCodes
        # Publisher Suggestions error codes
        #
        # http://developer.yext.com/docs/error-messages/#publisher-suggestion-errors
        module PublisherSuggestionsErrors
          include Yext::Api::Concerns::EnumAll

          SUGGESTION_ALREADY_RESOLVED             = { code:      7300,
                                                      http_code: 403,
                                                      message:   "Edit has already been resolved" }.freeze
          SUGGESTION_FOR_LOCATION_NOT_IN_BUSINESS = { code:      7301,
                                                      http_code: 403,
                                                      message:   "Edit is for a location not in business!" }.freeze
          SUGGESTION_NOT_FOUND                    = { code:      7302,
                                                      http_code: 403,
                                                      message:   "No edit found for that id!" }.freeze
          SUGGESTION_UNEXPECTED_UPDATE_ERROR      = { code:      7303,
                                                      http_code: 500,
                                                      message:   "Error updating the profile" }.freeze
          SUGGESTION_BAD_ID                       = { code:      7304,
                                                      http_code: 400,
                                                      message:   "Bad suggestion id" }.freeze
          SUGGESTION_UPDATE_BAD_STATUS            = { code:      7305,
                                                      http_code: 400,
                                                      message:   "Bad status: status must be either ACCEPTED or REJECTED" }.freeze
          SUGGESTION_OVER_LIMIT                   = { code:      7306,
                                                      http_code: 400,
                                                      message:   "Too many publisher suggestions requested: maximum 50 supported" }.freeze
          SUGGESTION_LIST_BAD_STATUS              = { code:      7307,
                                                      http_code: 400,
                                                      message:   "Bad status: valid statuses are PENDING, ACCEPTED, REJECTED, EXPIRED" }.freeze
          SUGGESTION_NO_USER_PROVIDED             = { code:      7308,
                                                      http_code: 400,
                                                      message:   "Must set either the Yext-Username or Yext-User-Id header" }.freeze
        end
      end
    end
  end
end
