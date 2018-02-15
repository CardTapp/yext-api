# frozen_string_literal: true

module Yext
  module Api
    module Enumerations
      class ErrorCodes
        # Customers error codes
        # Errors that happen when interacting with the Customers API
        #
        # http://developer.yext.com/docs/error-messages/#customers-errors
        module CustomersErrros
          include Yext::Api::Concerns::EnumAll

          CUSTOMER_NOT_FOUND                 = 1000
          UNABLE_TO_GET_ORDER                = 1001
          CANNOT_CHANGE_CUSTOMER_ID          = 1002
          CUSTOMER_ID_PENDING_ORDER          = 1003
          CUSTOMER_ID_TAKEN                  = 1004
          CUSTOMER_ID_LATIN1                 = 1005
          UNKNOWN_CUSTOMER_ATTRIBUTE_ID      = 1006
          CUSTOMER_ID_TOO_LONG               = 1007
          BUSINESS_NAME_TOO_LONG             = 1008
          BUSINESS_COUNTRY_TOO_LONG          = 1009
          BUSINESS_LANGUAGE_TOO_LONG         = 1010
          CONTACT_FIRSTNAME_TOO_LONG         = 1011
          CONTACT_LASTNAME_TOO_LONG          = 1012
          CONTACT_EMAIL_TOO_LONG             = 1013
          CONTACT_COUNTRY_TOO_LONG           = 1014
          CONTACT_COUNTRY_INVALID            = 1015
          BUSINESS_COUNTRY_INVALID           = 1016
          CONTACT_EMAIL_INVALID              = 1017
          CUSTOMER_ID_REQUIRED               = 1018
          BUSINESS_NAME_REQUIRED             = 1019
          CONTACT_FIRSTNAME_REQUIRED         = 1020
          CONTACT_LASTNAME_REQUIRED          = 1021
          CONTACT_PHONE_REQUIRED             = 1022
          CONTACT_EMAIL_REQUIRED             = 1023
          SUBSCRIPTIONS_REQUIRED             = 1024
          LOCATIONS_REQUIRED                 = 1025
          BUSINESS_COUNTRY_NOT_ELIGIBLE      = 1026
          CANNOT_RETRIEVE_BUSINESS_COUNTRIES = 1027
          BUSINESS_LANGUAGE_NOT_ELIGIBLE     = 1028
          CANNOT_RETRIEVE_BUSINESS_LANGUAGES = 1029
          CONTACT_PHONE_INVALID              = 1030
          LOCATION_ID_PENDING_ORDER          = 1031
          BUSINESS_COUNTRY_NOT_MUTABLE       = 1032
        end
      end
    end
  end
end
