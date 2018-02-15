# frozen_string_literal: true

module Yext
  module Api
    module Enumerations
      class ErrorCodes
        # Agreements error codes
        #
        # http://developer.yext.com/docs/error-messages/#agreements-errors
        module AgreementsErrors
          include Yext::Api::Concerns::EnumAll

          YAM_ACCOUNT_NOT_FOUND                     = { code:      1300,
                                                        http_code: 403,
                                                        message:   "Agreement management features are not enabled on this account." }.freeze
          SPECIFIED_SKUS_UNDER_AGREEMENT_NOT_FOUND  = { code:      1301,
                                                        http_code: 400,
                                                        message:   "Specified SKU(s) not available under agreement {0}.freeze: {1}.freeze." }.freeze
          AGREEMENT_WITH_SKUS_NOT_FOUND             = { code:      1302,
                                                        http_code: 400,
                                                        message:   "No active agreement containing all specified SKUs: {0}.freeze" }.freeze
          YAM_EXISTING_LOCATION_NOT_FOUND           = { code:      1303,
                                                        http_code: 400,
                                                        message:   "Location ID {0}.freeze specified does not exist in this account. To create " \
                                                                       "a new location to add service to, use the newlocationaddrequests " \
                                                                       "endpoint." }.freeze
          YAM_INVALID_LOCATION_ACCOUNT              = { code:      1304,
                                                        http_code: 400,
                                                        message:   "The specified account {0}.freeze does not exist." }.freeze
          YAM_LOCATION_ACCOUNT_NOT_MATCHED          = { code:      1305,
                                                        http_code: 400,
                                                        message:   "Location ID {0}.freeze specified does not exist in the specified account " \
                                                                       "{1}.freeze. To create a new location to add service to, use the " \
                                                                       "newlocationaddrequests endpoint." }.freeze
          YAM_MULTIPLE_LOCATIONS_FOUND              = { code:      1306,
                                                        http_code: 400,
                                                        message:   "Locations with ID {0}.freeze exist in the following accounts: {1}.freeze. " \
                                                                       "Specify a locationAccountId with the add request." }.freeze
          YAM_NO_LOCATIONS_FOUND                    = { code:      1307,
                                                        http_code: 400,
                                                        message:   "Location ID {0}.freeze does not exist in your account or any sub-accounts. " \
                                                                       "To create a new location to add service to, use the newlocationaddrequests " \
                                                                       "endpoint." }.freeze
          YAM_TRANSACTION_VALIDATION_FAILED         = { code:      1308,
                                                        http_code: 400,
                                                        message:   "{0}.freeze" }.freeze
          YAM_INVALID_SERVICE_STATUS_PARAMETER      = { code:      1309,
                                                        http_code: 400,
                                                        message:   "Invalid service status param: {0}.freeze" }.freeze
          YAM_INVALID_AGREEMENT_ID_PARAMETER        = { code:      1310,
                                                        http_code: 400,
                                                        message:   "Agreement ID must be an integer: {0}.freeze" }.freeze
          YAM_INVALID_LIMIT_PARAMETER               = { code:      1311,
                                                        http_code: 400,
                                                        message:   "Limit must be an integer from 0 - 1000: {0}.freeze" }.freeze
          YAM_INVALID_OFFSET_PARAMETER              = { code:      1312,
                                                        http_code: 400,
                                                        message:   "Offset must be an integer: {0}.freeze" }.freeze
          YAM_INVALID_ADD_REQUEST_STATUS_PARAMETER  = { code:      1313,
                                                        http_code: 400,
                                                        message:   "Invalid add request status param: {0}.freeze" }.freeze
          YAM_INVALID_LOCATION_ID_PARAMETER         = { code:      1314,
                                                        http_code: 400,
                                                        message:   "Location ID {0}.freeze specified does not exist in this account." }.freeze
          YAM_INVALID_DATE_FORMAT                   = { code:      1315,
                                                        http_code: 400,
                                                        message:   "Invalid value {0}.freeze for param {1}.freeze." }.freeze
          YAM_INVALID_ADD_REQUEST_ID_PARAMETER      = { code:      1316,
                                                        http_code: 400,
                                                        message:   "Add Request ID must be an integer: {0}.freeze." }.freeze
          YAM_ADD_REQUEST_NOT_FOUND                 = { code:      1317,
                                                        http_code: 404,
                                                        message:   "Add Request ID {0}.freeze not found." }.freeze
          YAM_INVALID_SKU                           = { code:      1318,
                                                        http_code: 400,
                                                        message:   "sku {0}.freeze is invalid" }.freeze
          YAM_NO_MATCHING_SERVICES                  = { code:      1319,
                                                        http_code: 400,
                                                        message:   "The location has no active services matching the criteria you " \
                                                                       "provided." }.freeze
          YAM_ERROR_CANCEL_SERVICES                 = { code:      1320,
                                                        http_code: 500,
                                                        message:   "An error was encountered while canceling services. Check the " \
                                                                       "status of the services you tried to cancel and contact support " \
                                                                       "if you continue to receive this message." }.freeze
          YAM_TOO_MANY_LOCATIONS_FOR_V1_TRANSLATION = { code:      1321,
                                                        http_code: 400,
                                                        message:   "API facade does not support adding multiple locations to 1 " \
                                                                       "subscription." }.freeze
          YAM_TRANSACTION_VALIDATION_ERROR          = { code:      1322,
                                                        http_code: 400,
                                                        message:   "{0}.freeze" }.freeze
          YAM_NO_SKUS_PROVIDED                      = { code:      1323,
                                                        http_code: 400,
                                                        message:   "SKUs must be provided." }.freeze
        end
      end
    end
  end
end
