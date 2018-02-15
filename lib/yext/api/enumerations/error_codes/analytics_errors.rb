# frozen_string_literal: true

module Yext
  module Api
    module Enumerations
      class ErrorCodes
        # Analytics error codes
        # Errors that happen when interacting with the Analytics API
        #
        # http://developer.yext.com/docs/error-messages/#analytics-errors
        module AnalyticsErrors
          include Yext::Api::Concerns::EnumAll

          SITE_NOT_FOUND                               = 5000
          REPORT_KEY_DOES_NOT_EXIST                    = 5001
          INSUFFICIENT_LOCATION_ACCESS                 = 5002
          DATABASE_PROBLEMS                            = 5003
          COULD_NOT_DESERIALIZE                        = 5004
          CUSTOMER_ID_NOT_FOUND                        = 5005
          INSUFFICIENT_FOLDER_ACCESS                   = 5006
          NO_RESULTS_FOUND                             = 5007
          CANNOT_SCAN_SITE                             = 5008
          SANDBOX_REPORTING_NOT_SUPPORTED              = 5009
          SQL_EXCEPTION                                = 5010
          SCAN_SERVER_ERROR                            = 5011
          CANNOT_PARSE_QUERY                           = 5012
          KEY_INVALID                                  = 5013
          KEY_REQUIRED                                 = 5014
          QUERY_UNSPECIFIED                            = 5015
          DIMENSIONS_UNSPECIFIED                       = 5016
          METRICS_UNSPECIFIED                          = 5017
          CANNOT_FILTER                                = 5018
          DATE_START_REQUIRED                          = 5019
          DATE_END_REQUIRED                            = 5020
          START_DATE_BEFORE_END_DATE                   = 5021
          DIMENSIONS_INVALID                           = 5022
          MAX_REPORTING_DATE_EXCEEDED                  = 5023
          FOURSQUARE_DATA_NOT_ACCESSIBLE               = 5024
          YELP_DATA_NOT_ACCESSIBLE                     = 5025
          SEARCH_TERM_REPORTING_DISABLED               = 5026
          REPORTING_CUSTOMER_ID_REQUIRED               = 5027
          FOURSQUARE_DIMS_NOT_APPLICABLE               = 5028
          BING_SEARCH_GRANULARITY                      = 5029
          DIMENSION_CONFLICT                           = 5030
          CUSTOMER_ID_DIMENSION_MUTLI_VALIDITY         = 5031
          CUSTOMER_ID_DIMENSION_PARENT_FOLDER_VALIDITY = 5032
          SCAN_NAME_REQUIRED                           = 5033
          SCAN_ADDRESS_REQUIRED                        = 5034
          SCAN_PHONE_REQUIRED                          = 5035
          SCAN_SITE_REQUIRED                           = 5036
          SCAN_COUNTRY_CODE_INVALID                    = 5037
          LISTING_PUT_STATUS_REQUIRED                  = 5038
          REPORTING_CUSTOMER_ID_INVALID                = 5039
          ROW_AXIS_SPECIFIED                           = 5040
          COLUMN_AXIS_SPECIFIED                        = 5041
          FILTER_SPECIFIED                             = 5042
          AXIS_SAME_DIMENSION                          = 5043
          VALUES_UNSELECTABLE                          = 5044
          SEARCH_DATE_END_INVALID                      = 5045
          SEARCH_START_INVALID                         = 5046
          SEARCH_LIMIT_INVALID                         = 5047
          SEARCH_SIZE_EXCEEDED                         = 5048
          SEARCH_FREQUENCY_MIN_INVALID                 = 5049
          SEARCH_FREQUENCY_MAX_INVALID                 = 5050
          SEARCH_FREQUENCY_MAX_INVALID2                = 5051
          SEARCH_DATE_MALFORMATTED                     = 5052
          SEARCH_DATE_REQUIRED                         = 5053
          SEARCH_START_LIMIT_MALFORMATTED              = 5054
          SEARCH_FREQUENCY_MAX_MIN_MALFORMATTED        = 5055
          SEARCH_PLATFORM_MALFORMATTED                 = 5056
          SEARCH_ENUM_MALFORMATTED                     = 5057
          GET_REPORT_FAILED                            = 5058
          SCAN_TIMEOUT                                 = 5059
          INVALID_ACTIVITY_TYPE                        = 5060
          INVALID_ACTOR                                = 5061
          REPORT_ID_NOT_FOUND                          = 5062
          CREATE_REPORT_VALIDATION_ERROR               = 5063
          INVALID_LISTINGS_LIVE_TYPE                   = 5064
        end
      end
    end
  end
end
