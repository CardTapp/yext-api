# frozen_string_literal: true

module Yext
  module Api
    module Enumerations
      class ErrorCodes
        # Subscription Error codes
        #
        # http://developer.yext.com/docs/error-messages/#subscriptions-errors
        module SubscriptionsErrors
          include Yext::Api::Concerns::EnumAll

          CANNOT_TERMINATE_SUBSCRIPTION                   = 3000
          CANNOT_CREATE_I18N_SUBSCRIPTION                 = 3001
          CANNOT_ADD_I18N_SUBSCRIPTION                    = 3002
          VALID_SUBSCRIPTION_ID_REQUIRED                  = 3003
          SUBSCRIPTION_NOT_FOUND                          = 3004
          CANNOT_CHANGE_CANCELED_SUBSCRIPTION             = 3005
          TOO_EARLY_TO_RENEW                              = 3006
          CANNOT_RENEW_CANCELED_SUBSCRIPTION              = 3007
          SUBSCRIPTION_API_EXCEPTION                      = 3008
          BILLING_FAILED                                  = 3009
          INVALID_OPERATION                               = 3010
          NOT_ELIGIBLE_FOR_OFFER                          = 3011
          PARENT_BUSINESS_NOT_SUBSCRIBED                  = 3012
          ERROR_CREATING_BUSINESS                         = 3013
          ERROR_CREATING_LOCATION                         = 3014
          ERROR_SUBSCRIBING_SUBSCRIPTION                  = 3015
          ERROR_RETRIEVING_SUBSCRIPTION                   = 3016
          RENEWING_SUBSCRIPTION_FAILED                    = 3017
          SUBSCRIPTION_CANCEL_ERROR                       = 3018
          UNCANCELING_SUBSCRIPTION_FAILED                 = 3019
          CANNOT_UPDATE_EXPIRED_SUBSCRIPTION              = 3020
          SUBSCRIPTION_CANNOT_BE_CANCELED                 = 3021
          CANNOT_CANCEL_EXPIRED_SUBSCRIPTION              = 3022
          CANNOT_ADD_LOCS_TO_INACTIVE_SUBSCRIPTION        = 3023
          ERROR_RETRIEVING_SUBSCRIPTION_BY_KEY            = 3024
          CANNOT_REMOVE_ALL_LOCATIONS                     = 3025
          UNEXPECTED_SUBSCRIPTION_STATE                   = 3026
          ERROR_UPDATING_SUBSCRIPTION                     = 3027
          ERROR_RETRIEVING_AMENDMENT                      = 3028
          ERROR_RETRIEVING_SUBSCRIPTION_INFORMATION       = 3029
          SUBSCRIPTION_VALIDATION_ERRORS                  = 3030
          NO_SUBSCRIPTION_ACCOUNT_ID                      = 3031
          SUBSCRIBE_ERROR                                 = 3032
          UNKNOWN_OFFER                                   = 3033
          NON_EXISTENT_LICENSE_PACK                       = 3034
          CANNOT_MODIFY_EXPIRED_LICENSE_PACK              = 3035
          MAX_LICENSE_PACK_LIMIT                          = 3036
          CANNOT_ADD_LOCS_TO_LICENSE_PACK                 = 3037
          MISSING_SUBSCRIPTION_ID                         = 3038
          MISSING_OFFER_ID                                = 3039
          INELIGIBLE_FOR_OFFER                            = 3040
          PARENT_BUSINESS_NOT_SUBSCRIBED2                 = 3041
          SUBSCRIPTION_OFFER_ID_REQUIRED                  = 3042
          SUBSCRIPTION_LOCATION_IDS_EMPTY                 = 3043
          SUBSCRIPTION_CANCEL_ACTIVATE                    = 3044
          SUBSCRIPTION_INVALID_STATUS                     = 3045
          SUBSCRIPTION_VOLTRON_CANNOT_CREATE_SUBSCRIPTION = 3046
          SUBSCRIPTION_CANNOT_HAVE_SPECIFIED_START_DATE   = 3047
          SUBSCRIPTION_START_DATE_BEYOND_NEXT_MONTH       = 3048
          SUBSCRIPTION_START_DATE_IN_PAST                 = 3049
          SUBSCRIPTION_INVALID_START_DATE_FORMAT          = 3050
          SUBSCRIPTION_INVALID_COUNTRY_IN_REQUEST         = 3051
          INVALID_OFFER                                   = 3052
        end
      end
    end
  end
end
