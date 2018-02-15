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

          YAM_ACCOUNT_NOT_FOUND                     = 1300
          SPECIFIED_SKUS_UNDER_AGREEMENT_NOT_FOUND  = 1301
          AGREEMENT_WITH_SKUS_NOT_FOUND             = 1302
          YAM_EXISTING_LOCATION_NOT_FOUND           = 1303
          YAM_INVALID_LOCATION_ACCOUNT              = 1304
          YAM_LOCATION_ACCOUNT_NOT_MATCHED          = 1305
          YAM_MULTIPLE_LOCATIONS_FOUND              = 1306
          YAM_NO_LOCATIONS_FOUND                    = 1307
          YAM_TRANSACTION_VALIDATION_FAILED         = 1308
          YAM_INVALID_SERVICE_STATUS_PARAMETER      = 1309
          YAM_INVALID_AGREEMENT_ID_PARAMETER        = 1310
          YAM_INVALID_LIMIT_PARAMETER               = 1311
          YAM_INVALID_OFFSET_PARAMETER              = 1312
          YAM_INVALID_ADD_REQUEST_STATUS_PARAMETER  = 1313
          YAM_INVALID_LOCATION_ID_PARAMETER         = 1314
          YAM_INVALID_DATE_FORMAT                   = 1315
          YAM_INVALID_ADD_REQUEST_ID_PARAMETER      = 1316
          YAM_ADD_REQUEST_NOT_FOUND                 = 1317
          YAM_INVALID_SKU                           = 1318
          YAM_NO_MATCHING_SERVICES                  = 1319
          YAM_ERROR_CANCEL_SERVICES                 = 1320
          YAM_TOO_MANY_LOCATIONS_FOR_V1_TRANSLATION = 1321
          YAM_TRANSACTION_VALIDATION_ERROR          = 1322
          YAM_NO_SKUS_PROVIDED                      = 1323
        end
      end
    end
  end
end
