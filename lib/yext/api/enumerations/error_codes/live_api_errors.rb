# frozen_string_literal: true

module Yext
  module Api
    module Enumerations
      class ErrorCodes
        # Live API error codes
        #
        # http://developer.yext.com/docs/error-messages/#live-api-errors
        module LiveApiErrors
          include Yext::Api::Concerns::EnumAll

          BAD_FIELDS_PARAMETER          = 1500
          BAD_LIMIT_PARAMETER           = 1501
          BAD_OFFSET_PARAMETER          = 1502
          BAD_FILTERS_PARAMETER         = 1503
          BAD_GEOCODING_PARAMETERS      = 1504
          BAD_LANGUAGES_PARAMETER       = 1505
          BAD_LANGUAGE_CODE_PARAMETER   = 1506
          BAD_RADIUS_PARAMETER          = 1507
          BAD_GEOCODING_BIAS_PARAMETER  = 1508
          EMPTY_LIST_ID_PARAMETER       = 1509
          EMPTY_LOCATION_ID_PARAMETER   = 1510
          EMPTY_LANGUAGE_CODE_PARAMETER = 1511
        end
      end
    end
  end
end
