# frozen_string_literal: true

module Yext
  module Api
    module Enumerations
      class ErrorCodes
        # Analytics error codes
        # Errors that happen when interacting with the Analytics API
        #
        # http://developer.yext.com/docs/error-messages/#analytics-errors

        # rubocop:disable Metrics/ModuleLength
        module AnalyticsErrors
          include Yext::Api::Concerns::EnumAll

          SITE_NOT_FOUND                               = { code:      5000,
                                                           http_code: 400,
                                                           message:   "Site not found: [siteId]" }.freeze
          REPORT_KEY_DOES_NOT_EXIST                    = { code:      5001,
                                                           http_code: 404,
                                                           message:   "The given key does not exist or has expired." }.freeze
          INSUFFICIENT_LOCATION_ACCESS                 = { code:      5002,
                                                           http_code: 403,
                                                           message:   "You do not currently have access to data for this location." }.freeze
          DATABASE_PROBLEMS                            = { code:      5003,
                                                           http_code: 503,
                                                           message:   "We are experiencing unexpected database problems. Please " \
                                                                          "contact support if this problem persists." }.freeze
          COULD_NOT_DESERIALIZE                        = { code:      5004,
                                                           http_code: 400,
                                                           message:   "We were unable to deserialize your formencoded request: " \
                                                                          "Could not deserialize [metric]" }.freeze
          CUSTOMER_ID_NOT_FOUND                        = { code:      5005,
                                                           http_code: 403,
                                                           message:   "Customer ID not found" }.freeze
          INSUFFICIENT_FOLDER_ACCESS                   = { code:      5006,
                                                           http_code: 403,
                                                           message:   "You do not currently have access to this folder" }.freeze
          NO_RESULTS_FOUND                             = { code:      5007,
                                                           http_code: 404,
                                                           message:   "No results found for partner" }.freeze
          CANNOT_SCAN_SITE                             = { code:      5008,
                                                           http_code: 400,
                                                           message:   "[site] cannot be scanned" }.freeze
          SANDBOX_REPORTING_NOT_SUPPORTED              = { code:      5009,
                                                           http_code: 404,
                                                           message:   "Reporting is not supported on sandbox." }.freeze
          SQL_EXCEPTION                                = { code:      5010,
                                                           http_code: 500,
                                                           message:   "SQL Exception" }.freeze
          SCAN_SERVER_ERROR                            = { code:      5011,
                                                           http_code: 500,
                                                           message:   "Scan server error" }.freeze
          CANNOT_PARSE_QUERY                           = { code:      5012,
                                                           http_code: 400,
                                                           message:   "Cannot parse query" }.freeze
          KEY_INVALID                                  = { code:      5013,
                                                           http_code: 400,
                                                           message:   "The specified key is invalid." }.freeze
          KEY_REQUIRED                                 = { code:      5014,
                                                           http_code: 400,
                                                           message:   "key: The field key is required" }.freeze
          QUERY_UNSPECIFIED                            = { code:      5015,
                                                           http_code: 400,
                                                           message:   "You must fully specify your query." }.freeze
          DIMENSIONS_UNSPECIFIED                       = { code:      5016,
                                                           http_code: 400,
                                                           message:   "You must specify the dimensions of the report." }.freeze
          METRICS_UNSPECIFIED                          = { code:      5017,
                                                           http_code: 400,
                                                           message:   "You must specify the metrics in the report." }.freeze
          CANNOT_FILTER                                = { code:      5018,
                                                           http_code: 400,
                                                           message:   "Cannot filter on both locationId and parentFolderId" }.freeze
          DATE_START_REQUIRED                          = { code:      5019,
                                                           http_code: 400,
                                                           message:   "The dateStart field is required" }.freeze
          DATE_END_REQUIRED                            = { code:      5020,
                                                           http_code: 400,
                                                           message:   "The dateEnd field is required" }.freeze
          START_DATE_BEFORE_END_DATE                   = { code:      5021,
                                                           http_code: 400,
                                                           message:   "Start date must be on or before end date." }.freeze
          DIMENSIONS_INVALID                           = { code:      5022,
                                                           http_code: 400,
                                                           message:   "You must provide either a customerId parameter or have " \
                                                                          "CUSTOMER_IDS in the dimensions" }.freeze
          MAX_REPORTING_DATE_EXCEEDED                  = { code:      5023,
                                                           http_code: 400,
                                                           message:   "Start and end dates must both be before the max reporting date " \
                                                                          "[maxReportingDate]" }.freeze
          FOURSQUARE_DATA_NOT_ACCESSIBLE               = { code:      5024,
                                                           http_code: 400,
                                                           message:   "This api_key does not have access to Foursquare reporting data" }.freeze
          YELP_DATA_NOT_ACCESSIBLE                     = { code:      5025,
                                                           http_code: 400,
                                                           message:   "This api_key does not have access to Yelp reporting data" }.freeze
          SEARCH_TERM_REPORTING_DISABLED               = { code:      5026,
                                                           http_code: 400,
                                                           message:   "This business does not have Search Term Reporting enabled" }.freeze
          REPORTING_CUSTOMER_ID_REQUIRED               = { code:      5027,
                                                           http_code: 400,
                                                           message:   "customerId is required" }.freeze
          FOURSQUARE_DIMS_NOT_APPLICABLE               = { code:      5028,
                                                           http_code: 400,
                                                           message:   "Foursquare dimensions can only be used with " \
                                                                          "FOURSQUAREDAILYCHECKINS metric" }.freeze
          BING_SEARCH_GRANULARITY                      = { code:      5029,
                                                           http_code: 400,
                                                           message:   "Bing Searches cannot be viewed by month or by day" }.freeze
          DIMENSION_CONFLICT                           = { code:      5030,
                                                           http_code: 400,
                                                           message:   "No two dimensions should measure the same aspect of the data." }.freeze
          CUSTOMER_ID_DIMENSION_MUTLI_VALIDITY         = { code:      5031,
                                                           http_code: 400,
                                                           message:   "CUSTOMER_IDS only valid on multi-customer queries" }.freeze
          CUSTOMER_ID_DIMENSION_PARENT_FOLDER_VALIDITY = { code:      5032,
                                                           http_code: 400,
                                                           message:   "CUSTOMER_IDS are not valid with a parentFolderId filter" }.freeze
          SCAN_NAME_REQUIRED                           = { code:      5033,
                                                           http_code: 400,
                                                           message:   "name: The field name is required" }.freeze
          SCAN_ADDRESS_REQUIRED                        = { code:      5034,
                                                           http_code: 400,
                                                           message:   "address: The field address is required" }.freeze
          SCAN_PHONE_REQUIRED                          = { code:      5035,
                                                           http_code: 400,
                                                           message:   "phone: The field phone is required" }.freeze
          SCAN_SITE_REQUIRED                           = { code:      5036,
                                                           http_code: 400,
                                                           message:   "siteId: The field siteId is required" }.freeze
          SCAN_COUNTRY_CODE_INVALID                    = { code:      5037,
                                                           http_code: 400,
                                                           message:   "The countryCode is invalid" }.freeze
          LISTING_PUT_STATUS_REQUIRED                  = { code:      5038,
                                                           http_code: 400,
                                                           message:   "status is required and must be OPTED_IN or OPTED_OUT" }.freeze
          REPORTING_CUSTOMER_ID_INVALID                = { code:      5039,
                                                           http_code: 400,
                                                           message:   "customerId: Invalid id" }.freeze
          ROW_AXIS_SPECIFIED                           = { code:      5040,
                                                           http_code: 400,
                                                           message:   "You must specify the 'rowAxis'." }.freeze
          COLUMN_AXIS_SPECIFIED                        = { code:      5041,
                                                           http_code: 400,
                                                           message:   "You must specify the 'columnAxis'." }.freeze
          FILTER_SPECIFIED                             = { code:      5042,
                                                           http_code: 400,
                                                           message:   "Exactly one filter value must be specified when " \
                                                                          "'cols' is not set to 'VALUES'" }.freeze
          AXIS_SAME_DIMENSION                          = { code:      5043,
                                                           http_code: 400,
                                                           message:   "The axes may not have the same dimension." }.freeze
          VALUES_UNSELECTABLE                          = { code:      5044,
                                                           http_code: 400,
                                                           message:   "VALUES' may not be selected for the 'rows' axis." }.freeze
          SEARCH_DATE_END_INVALID                      = { code:      5045,
                                                           http_code: 400,
                                                           message:   "dateEnd: Must be on or before dateStart" }.freeze
          SEARCH_START_INVALID                         = { code:      5046,
                                                           http_code: 400,
                                                           message:   "start: start must be greater than 0" }.freeze
          SEARCH_LIMIT_INVALID                         = { code:      5047,
                                                           http_code: 400,
                                                           message:   "limit: limit must be between 0 and 100 inclusive" }.freeze
          SEARCH_SIZE_EXCEEDED                         = { code:      5048,
                                                           http_code: 400,
                                                           message:   "search: You can specify a maximum of 5 strings" }.freeze
          SEARCH_FREQUENCY_MIN_INVALID                 = { code:      5049,
                                                           http_code: 400,
                                                           message:   "frequencyMin: frequencyMin must be between 0 and 100 inclusive" }.freeze
          SEARCH_FREQUENCY_MAX_INVALID                 = { code:      5050,
                                                           http_code: 400,
                                                           message:   "frequencyMax: frequencyMax must be between 0 and 100 inclusive" }.freeze
          SEARCH_FREQUENCY_MAX_INVALID2                = { code:      5051,
                                                           http_code: 400,
                                                           message:   "frequencyMax: Must be greater than or equal to frequencyMin" }.freeze
          SEARCH_DATE_MALFORMATTED                     = { code:      5052,
                                                           http_code: 400,
                                                           message:   "[dateStart/dateEnd]: Must have the format yyyy-mm-dd" }.freeze
          SEARCH_DATE_REQUIRED                         = { code:      5053,
                                                           http_code: 400,
                                                           message:   "[dateStart/dateEnd]: The field dateStart/dateEnd is required" }.freeze
          SEARCH_START_LIMIT_MALFORMATTED              = { code:      5054,
                                                           http_code: 400,
                                                           message:   "[start/limit]: Must be an integer" }.freeze
          SEARCH_FREQUENCY_MAX_MIN_MALFORMATTED        = { code:      5055,
                                                           http_code: 400,
                                                           message:   "[frequencyMin/Max]: Must be a double" }.freeze
          SEARCH_PLATFORM_MALFORMATTED                 = { code:      5056,
                                                           http_code: 400,
                                                           message:   "platform: Must be a double" }.freeze
          SEARCH_ENUM_MALFORMATTED                     = { code:      5057,
                                                           http_code: 400,
                                                           message:   "[displayMethod/platformType/termType/sortBy/sortDir]: " \
                                                                          "Must be one of '[possibleEnumerations]'" }.freeze
          GET_REPORT_FAILED                            = { code:      5058,
                                                           http_code: 400,
                                                           message:   "{0}.freeze Get Report failed" }.freeze
          SCAN_TIMEOUT                                 = { code:      5059,
                                                           http_code: 504,
                                                           message:   "Scan response has timed out" }.freeze
          INVALID_ACTIVITY_TYPE                        = { code:      5060,
                                                           http_code: 400,
                                                           message:   "One of the activityTypes is invalid" }.freeze
          INVALID_ACTOR                                = { code:      5061,
                                                           http_code: 400,
                                                           message:   "actors: Must be YEXT, PUBLISHER or list of valid email addresses" }.freeze
          REPORT_ID_NOT_FOUND                          = { code:      5062,
                                                           http_code: 404,
                                                           message:   "The reportId {0}.freeze does not exist." }.freeze
          CREATE_REPORT_VALIDATION_ERROR               = { code:      5063,
                                                           http_code: 400,
                                                           message:   "There was a validation error: {0}.freeze" }.freeze
          INVALID_LISTINGS_LIVE_TYPE                   = { code:      5064,
                                                           http_code: 400,
                                                           message:   "ListingsLiveType : must be CLAIMED or CREATED" }.freeze
        end
        # rubocop:enable Metrics/ModuleLength
      end
    end
  end
end
