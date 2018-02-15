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

          SUGGESTION_ALREADY_RESOLVED             = 7300
          SUGGESTION_FOR_LOCATION_NOT_IN_BUSINESS = 7301
          SUGGESTION_NOT_FOUND                    = 7302
          SUGGESTION_UNEXPECTED_UPDATE_ERROR      = 7303
          SUGGESTION_BAD_ID                       = 7304
          SUGGESTION_UPDATE_BAD_STATUS            = 7305
          SUGGESTION_OVER_LIMIT                   = 7306
          SUGGESTION_LIST_BAD_STATUS              = 7307
          SUGGESTION_NO_USER_PROVIDED             = 7308
        end
      end
    end
  end
end
