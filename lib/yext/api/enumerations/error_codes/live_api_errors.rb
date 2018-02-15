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

          BAD_FIELDS_PARAMETER          = { code:      1500,
                                            http_code: 400,
                                            message:   "Invalid fields param for location {0}.freeze: {1}.freeze" }.freeze
          BAD_LIMIT_PARAMETER           = { code:      1501,
                                            http_code: 400,
                                            message:   "Invalid limit param: {0}.freeze" }.freeze
          BAD_OFFSET_PARAMETER          = { code:      1502,
                                            http_code: 400,
                                            message:   "Invalid offset param: {0}.freeze" }.freeze
          BAD_FILTERS_PARAMETER         = { code:      1503,
                                            http_code: 400,
                                            message:   "Invalid filters param: {0}.freeze" }.freeze
          BAD_GEOCODING_PARAMETERS      = { code:      1504,
                                            http_code: 400,
                                            message:   "Invalid geocoding params: {0}.freeze, {1}.freeze, {2}.freeze" }.freeze
          BAD_LANGUAGES_PARAMETER       = { code:      1505,
                                            http_code: 400,
                                            message:   "Invalid languages param for location {0}.freeze: {1}.freeze" }.freeze
          BAD_LANGUAGE_CODE_PARAMETER   = { code:      1506,
                                            http_code: 400,
                                            message:   "Language code does not exist for location {0}.freeze: {1}.freeze" }.freeze
          BAD_RADIUS_PARAMETER          = { code:      1507,
                                            http_code: 400,
                                            message:   "Invalid radius param: {0}.freeze" }.freeze
          BAD_GEOCODING_BIAS_PARAMETER  = { code:      1508,
                                            http_code: 400,
                                            message:   "Invalid geocoding bias param: {0}.freeze" }.freeze
          EMPTY_LIST_ID_PARAMETER       = { code:      1509,
                                            http_code: 400,
                                            message:   "An enhanced list ID param must be provided" }.freeze
          EMPTY_LOCATION_ID_PARAMETER   = { code:      1510,
                                            http_code: 400,
                                            message:   "A location ID param must be provided" }.freeze
          EMPTY_LANGUAGE_CODE_PARAMETER = { code:      1511,
                                            http_code: 400,
                                            message:   "A language code param must be provided" }.freeze
        end
      end
    end
  end
end
