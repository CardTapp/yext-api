# frozen_string_literal: true

module Yext
  module Api
    module Enumerations
      class ErrorCodes
        # Subscription Error codes
        #
        # http://developer.yext.com/docs/error-messages/#subscriptions-errors

        # rubocop:disable Metrics/ModuleLength
        module SubscriptionsErrors
          include Yext::Api::Concerns::EnumAll

          CANNOT_TERMINATE_SUBSCRIPTION                   = { code:      3000,
                                                              http_code: 403,
                                                              message:   "You do not have permission to immediately stop service" }.freeze
          CANNOT_CREATE_I18N_SUBSCRIPTION                 = { code:      3001,
                                                              http_code: 400,
                                                              message:   "Cannot create subscription for international " \
                                                                             "location: [locationId]" }.freeze
          CANNOT_ADD_I18N_SUBSCRIPTION                    = { code:      3002,
                                                              http_code: 400,
                                                              message:   "Cannot add subscription to international location: [locationId]" }.freeze
          VALID_SUBSCRIPTION_ID_REQUIRED                  = { code:      3003,
                                                              http_code: 400,
                                                              message:   "Must provide a valid subscription id" }.freeze
          SUBSCRIPTION_NOT_FOUND                          = { code:      3004,
                                                              http_code: 400,
                                                              message:   "Subscription not found: [subscriptionId]" }.freeze
          CANNOT_CHANGE_CANCELED_SUBSCRIPTION             = { code:      3005,
                                                              http_code: 400,
                                                              message:   "Canont change a canceled subscription: [subscriptionId]" }.freeze
          TOO_EARLY_TO_RENEW                              = { code:      3006,
                                                              http_code: 403,
                                                              message:   "Cannot renew subscription before [earliestRenewalDate]" }.freeze
          CANNOT_RENEW_CANCELED_SUBSCRIPTION              = { code:      3007,
                                                              http_code: 400,
                                                              message:   "Cannot renew a canceled subscription [subscriptionId]" }.freeze
          SUBSCRIPTION_API_EXCEPTION                      = { code:      3008,
                                                              http_code: 500,
                                                              message:   "Exception in modifying subscription. Please contact support." }.freeze
          BILLING_FAILED                                  = { code:      3009,
                                                              http_code: 500,
                                                              message:   "Billing Failed [errorMessage]" }.freeze
          INVALID_OPERATION                               = { code:      3010,
                                                              http_code: 500,
                                                              message:   "Operation currently not supported for this account" }.freeze
          NOT_ELIGIBLE_FOR_OFFER                          = { code:      3011,
                                                              http_code: 500,
                                                              message:   "Not eligible for offer [offerId]" }.freeze
          PARENT_BUSINESS_NOT_SUBSCRIBED                  = { code:      3012,
                                                              http_code: 500,
                                                              message:   "Parent business doesn't have Subscriptions Account [customerId]" }.freeze
          ERROR_CREATING_BUSINESS                         = { code:      3013,
                                                              http_code: 500,
                                                              message:   "Error creating business [errorMessage]" }.freeze
          ERROR_CREATING_LOCATION                         = { code:      3014,
                                                              http_code: 500,
                                                              message:   "Error creating location [errorMessage]" }.freeze
          ERROR_SUBSCRIBING_SUBSCRIPTION                  = { code:      3015,
                                                              http_code: 500,
                                                              message:   "Error subscribing subscription" }.freeze
          ERROR_RETRIEVING_SUBSCRIPTION                   = { code:      3016,
                                                              http_code: 500,
                                                              message:   "Error retrieving subscription" }.freeze
          RENEWING_SUBSCRIPTION_FAILED                    = { code:      3017,
                                                              http_code: 500,
                                                              message:   "Renewing subscription failed" }.freeze
          SUBSCRIPTION_CANCEL_ERROR                       = { code:      3018,
                                                              http_code: 500,
                                                              message:   "Error canceling subscription" }.freeze
          UNCANCELING_SUBSCRIPTION_FAILED                 = { code:      3019,
                                                              http_code: 500,
                                                              message:   "Uncanceling subscription failed." }.freeze
          CANNOT_UPDATE_EXPIRED_SUBSCRIPTION              = { code:      3020,
                                                              http_code: 400,
                                                              message:   "Cannot modify expired subscription." }.freeze
          SUBSCRIPTION_CANNOT_BE_CANCELED                 = { code:      3021,
                                                              http_code: 500,
                                                              message:   "Subscription [subscriptionName] cannot be canceled due to " \
                                                                             "contractual obligations." }.freeze
          CANNOT_CANCEL_EXPIRED_SUBSCRIPTION              = { code:      3022,
                                                              http_code: 500,
                                                              message:   "Subscription [subscriptonId] has expired and cannot be " \
                                                                             "modified." }.freeze
          CANNOT_ADD_LOCS_TO_INACTIVE_SUBSCRIPTION        = { code:      3023,
                                                              http_code: 400,
                                                              message:   "Subscription [subscriptionId] must be ACTIVE before adding " \
                                                                             "additional locations" }.freeze
          ERROR_RETRIEVING_SUBSCRIPTION_BY_KEY            = { code:      3024,
                                                              http_code: 500,
                                                              message:   "Error retrieving subscription by key" }.freeze
          CANNOT_REMOVE_ALL_LOCATIONS                     = { code:      3025,
                                                              http_code: 500,
                                                              message:   "Cannot remove all locations. Cancel the subscription instead." }.freeze
          UNEXPECTED_SUBSCRIPTION_STATE                   = { code:      3026,
                                                              http_code: 500,
                                                              message:   "Subscription is in an unexpected state [status]" }.freeze
          ERROR_UPDATING_SUBSCRIPTION                     = { code:      3027,
                                                              http_code: 500,
                                                              message:   "Error updating subscription" }.freeze
          ERROR_RETRIEVING_AMENDMENT                      = { code:      3028,
                                                              http_code: 500,
                                                              message:   "Error getting amendment" }.freeze
          ERROR_RETRIEVING_SUBSCRIPTION_INFORMATION       = { code:      3029,
                                                              http_code: 500,
                                                              message:   "Error retrieving subscription information" }.freeze
          SUBSCRIPTION_VALIDATION_ERRORS                  = { code:      3030,
                                                              http_code: 500,
                                                              message:   "Business [businessId] trying to enjoy offer [offerId] " \
                                                                             "has the following validation errors:n[errors]" }.freeze
          NO_SUBSCRIPTION_ACCOUNT_ID                      = { code:      3031,
                                                              http_code: 500,
                                                              message:   "Business has no subscription account id" }.freeze
          SUBSCRIBE_ERROR                                 = { code:      3032,
                                                              http_code: 500,
                                                              message:   "Error in subscribe" }.freeze
          UNKNOWN_OFFER                                   = { code:      3033,
                                                              http_code: 500,
                                                              message:   "Unknown offer [offerId]" }.freeze
          NON_EXISTENT_LICENSE_PACK                       = { code:      3034,
                                                              http_code: 500,
                                                              message:   "License pack does not exist." }.freeze
          CANNOT_MODIFY_EXPIRED_LICENSE_PACK              = { code:      3035,
                                                              http_code: 500,
                                                              message:   "Cannot modify expired license pack." }.freeze
          MAX_LICENSE_PACK_LIMIT                          = { code:      3036,
                                                              http_code: 500,
                                                              message:   "Cannot assign more locations than licensePack quantity [quantity]" }.freeze
          CANNOT_ADD_LOCS_TO_LICENSE_PACK                 = { code:      3037,
                                                              http_code: 500,
                                                              message:   "This license pack cannot have more than [quantity] location(s) " \
                                                                             "assigned to it" }.freeze
          MISSING_SUBSCRIPTION_ID                         = { code:      3038,
                                                              http_code: 400,
                                                              message:   "subscriptionId: Missing subscriptionId" }.freeze
          MISSING_OFFER_ID                                = { code:      3039,
                                                              http_code: 400,
                                                              message:   "Missing offerId" }.freeze
          INELIGIBLE_FOR_OFFER                            = { code:      3040,
                                                              http_code: 400,
                                                              message:   "eligible: Ineligible for offer [offerId]" }.freeze
          PARENT_BUSINESS_NOT_SUBSCRIBED2                 = { code:      3041,
                                                              http_code: 400,
                                                              message:   "Parent business doesn't have subscription account: " \
                                                                             "[parentBusinessId]" }.freeze
          SUBSCRIPTION_OFFER_ID_REQUIRED                  = { code:      3042,
                                                              http_code: 400,
                                                              message:   "subscription.offerId: The field subscription.offerId is required" }.freeze
          SUBSCRIPTION_LOCATION_IDS_EMPTY                 = { code:      3043,
                                                              http_code: 400,
                                                              message:   "locationIds: locationIds cannot be empty; cancel the subscription " \
                                                                             "instead" }.freeze
          SUBSCRIPTION_CANCEL_ACTIVATE                    = { code:      3044,
                                                              http_code: 400,
                                                              message:   "Cannot simultaneously cancel a subscription and add additional " \
                                                                             "locations." }.freeze
          SUBSCRIPTION_INVALID_STATUS                     = { code:      3045,
                                                              http_code: 400,
                                                              message:   "status: Invalid status: [status]" }.freeze
          SUBSCRIPTION_VOLTRON_CANNOT_CREATE_SUBSCRIPTION = { code:      3046,
                                                              http_code: 405,
                                                              message:   "Creation of new subscriptions is not currently available for your " \
                                                                             "account. You can add or remove locations to your existing " \
                                                                             "subscriptions or contact support for additional details." }.freeze
          SUBSCRIPTION_CANNOT_HAVE_SPECIFIED_START_DATE   = { code:      3047,
                                                              http_code: 400,
                                                              message:   "startDate is an invalid field" }.freeze
          SUBSCRIPTION_START_DATE_BEYOND_NEXT_MONTH       = { code:      3048,
                                                              http_code: 400,
                                                              message:   "startDate may not be specified beyond the next calendar month" }.freeze
          SUBSCRIPTION_START_DATE_IN_PAST                 = { code:      3049,
                                                              http_code: 400,
                                                              message:   "startDate may not be in the past" }.freeze
          SUBSCRIPTION_INVALID_START_DATE_FORMAT          = { code:      3050,
                                                              http_code: 400,
                                                              message:   "startDate does not have valid date or in format yyyy-MM-dd" }.freeze
          SUBSCRIPTION_INVALID_COUNTRY_IN_REQUEST         = { code:      3051,
                                                              http_code: 400,
                                                              message:   "Country provided is invalid" }.freeze
          INVALID_OFFER                                   = { code:      3052,
                                                              http_code: 400,
                                                              message:   "{0}.freeze" }.freeze
        end
        # rubocop:enable Metrics/ModuleLength
      end
    end
  end
end
