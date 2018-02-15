# frozen_string_literal: true

module Yext
  module Api
    module Enumerations
      class ErrorCodes
        # Customers error codes
        # Errors that happen when interacting with the Customers API
        #
        # http://developer.yext.com/docs/error-messages/#customers-errors

        # rubocop:disable Metrics/ModuleLength
        module CustomersErrros
          include Yext::Api::Concerns::EnumAll

          CUSTOMER_NOT_FOUND                 = { code:      1000,
                                                 http_code: 400,
                                                 message:   "Customer not found: [customerId]" }.freeze
          UNABLE_TO_GET_ORDER                = { code:      1001,
                                                 http_code: 404,
                                                 message:   "Unable to get orders" }.freeze
          CANNOT_CHANGE_CUSTOMER_ID          = { code:      1002,
                                                 http_code: 400,
                                                 message:   "You are not allowed to change a customer's id" }.freeze
          CUSTOMER_ID_PENDING_ORDER          = { code:      1003,
                                                 http_code: 400,
                                                 message:   "There is already a pending order for a business with id [customerId]" }.freeze
          CUSTOMER_ID_TAKEN                  = { code:      1004,
                                                 http_code: 400,
                                                 message:   "Business with id [customerId] already exists" }.freeze
          CUSTOMER_ID_LATIN1                 = { code:      1005,
                                                 http_code: 400,
                                                 message:   "Only Latin1 characters are allowed in businessId" }.freeze
          UNKNOWN_CUSTOMER_ATTRIBUTE_ID      = { code:      1006,
                                                 http_code: 400,
                                                 message:   "customerAttributes: Unknown customer attribute ID [customerAttributeId]" }.freeze
          CUSTOMER_ID_TOO_LONG               = { code:      1007,
                                                 http_code: 400,
                                                 message:   "id: The field id is too long; maximum size is 50" }.freeze
          BUSINESS_NAME_TOO_LONG             = { code:      1008,
                                                 http_code: 400,
                                                 message:   "businessName: The field businessName is too long; maximum size is 255" }.freeze
          BUSINESS_COUNTRY_TOO_LONG          = { code:      1009,
                                                 http_code: 400,
                                                 message:   "businessCountry: The field businessCountry is too long; maximum size is 2" }.freeze
          BUSINESS_LANGUAGE_TOO_LONG         = { code:      1010,
                                                 http_code: 400,
                                                 message:   "businessLangauge: The field businessLangauge is too long; maximum size is 10" }.freeze
          CONTACT_FIRSTNAME_TOO_LONG         = { code:      1011,
                                                 http_code: 400,
                                                 message:   "contactFirstName: The field contactFirstName is too long; maximum size is 80" }.freeze
          CONTACT_LASTNAME_TOO_LONG          = { code:      1012,
                                                 http_code: 400,
                                                 message:   "contactLastName: The field contactLastName is too long; maximum size is 80" }.freeze
          CONTACT_EMAIL_TOO_LONG             = { code:      1013,
                                                 http_code: 400,
                                                 message:   "contactEmail: The field contactEmail is too long; maximum size is 255" }.freeze
          CONTACT_COUNTRY_TOO_LONG           = { code:      1014,
                                                 http_code: 400,
                                                 message:   "contactCountry: The field contactCountry is too long; maximum size is 2" }.freeze
          CONTACT_COUNTRY_INVALID            = { code:      1015,
                                                 http_code: 400,
                                                 message:   "contactCountry: Country is not valid" }.freeze
          BUSINESS_COUNTRY_INVALID           = { code:      1016,
                                                 http_code: 400,
                                                 message:   "businessCountry: Country is not valid" }.freeze
          CONTACT_EMAIL_INVALID              = { code:      1017,
                                                 http_code: 400,
                                                 message:   "contactEmail: The field contactEmail is not a valid email" }.freeze
          CUSTOMER_ID_REQUIRED               = { code:      1018,
                                                 http_code: 400,
                                                 message:   "id: The field id is required" }.freeze
          BUSINESS_NAME_REQUIRED             = { code:      1019,
                                                 http_code: 400,
                                                 message:   "businessName: The field businessName is required" }.freeze
          CONTACT_FIRSTNAME_REQUIRED         = { code:      1020,
                                                 http_code: 400,
                                                 message:   "contactFirstName: The field contactFirstName is required" }.freeze
          CONTACT_LASTNAME_REQUIRED          = { code:      1021,
                                                 http_code: 400,
                                                 message:   "contactLastName: The field contactLastName is required" }.freeze
          CONTACT_PHONE_REQUIRED             = { code:      1022,
                                                 http_code: 400,
                                                 message:   "contactPhone: The field contactPhone is required" }.freeze
          CONTACT_EMAIL_REQUIRED             = { code:      1023,
                                                 http_code: 400,
                                                 message:   "contactEmail: The field contactEmail is required" }.freeze
          SUBSCRIPTIONS_REQUIRED             = { code:      1024,
                                                 http_code: 400,
                                                 message:   "subscriptions: The field subscriptions is required" }.freeze
          LOCATIONS_REQUIRED                 = { code:      1025,
                                                 http_code: 400,
                                                 message:   "locations: The field locations is required" }.freeze
          BUSINESS_COUNTRY_NOT_ELIGIBLE      = { code:      1026,
                                                 http_code: 400,
                                                 message:   "businessCountry: Country is not eligible" }.freeze
          CANNOT_RETRIEVE_BUSINESS_COUNTRIES = { code:      1027,
                                                 http_code: 400,
                                                 message:   "businessCountry: Could not get a list of eligible countries for business" }.freeze
          BUSINESS_LANGUAGE_NOT_ELIGIBLE     = { code:      1028,
                                                 http_code: 400,
                                                 message:   "businessLanguage: Language is not eligible for country [businessCountry]" }.freeze
          CANNOT_RETRIEVE_BUSINESS_LANGUAGES = { code:      1029,
                                                 http_code: 400,
                                                 message:   "businessLanguage: Could not get eligible languages for business." }.freeze
          CONTACT_PHONE_INVALID              = { code:      1030,
                                                 http_code: 400,
                                                 message:   "contactPhone: Not a valid phone number" }.freeze
          LOCATION_ID_PENDING_ORDER          = { code:      1031,
                                                 http_code: 400,
                                                 message:   "There is already a pending order with id {0}.freeze for one or " \
                                                                "more of the requested locations" }.freeze
          BUSINESS_COUNTRY_NOT_MUTABLE       = { code:      1032,
                                                 http_code: 400,
                                                 message:   "businessCountry: Cannot change the country for a business" }.freeze
        end
        # rubocop:enable Metrics/ModuleLength
      end
    end
  end
end
