# frozen_string_literal: true

module Yext
  module Api
    module Enumerations
      class ErrorCodes
        # User error codes
        #
        # http://developer.yext.com/docs/error-messages/#users-errors

        # rubocop:disable Metrics/ModuleLength
        module UsersErrors
          include Yext::Api::Concerns::EnumAll

          USER_NOT_FOUND               = { code:      4000,
                                           http_code: 404,
                                           message:   "User not found: [userId]" }.freeze
          USER_CANNNOT_DELETE_SELF     = { code:      4001,
                                           http_code: 400,
                                           message:   "User cannot delete self" }.freeze
          USER_OWNS_CUSTOMERS          = { code:      4002,
                                           http_code: 400,
                                           message:   "Users that own customers cannot be deleted via the API" }.freeze
          USER_OWNS_FOLDERS            = { code:      4003,
                                           http_code: 400,
                                           message:   "Users that own folders cannot be deleted via the API" }.freeze
          USER_OWNS_LOCATIONS          = { code:      4004,
                                           http_code: 400,
                                           message:   "Users that own locations cannot be deleted via the API" }.freeze
          USER_ID_REQUIRED             = { code:      4005,
                                           http_code: 400,
                                           message:   "id: The field id is required" }.freeze
          USER_ID_TAKEN                = { code:      4006,
                                           http_code: 400,
                                           message:   "id: User with given id already exists" }.freeze
          CANNOT_CHANGE_USER_ID        = { code:      4007,
                                           http_code: 400,
                                           message:   "You are not allowed to change a user's id" }.freeze
          USERNAME_NONEMPTY            = { code:      4008,
                                           http_code: 400,
                                           message:   "username: Must be non-empty" }.freeze
          USERNAME_ILLEGAL_CHARS       = { code:      4009,
                                           http_code: 400,
                                           message:   "username: Contains illegal characters" }.freeze
          USERNAME_TAKEN               = { code:      4010,
                                           http_code: 400,
                                           message:   "username: Another user already has this username" }.freeze
          ACL_MISSING_ROLE_ID          = { code:      4011,
                                           http_code: 400,
                                           message:   "acl: At least one ACL entry missing roleId" }.freeze
          ACL_MISSING_ON               = { code:      4012,
                                           http_code: 400,
                                           message:   "acl: At least one ACL entry missing on" }.freeze
          ACL_MISSING_ON_TYPE          = { code:      4013,
                                           http_code: 400,
                                           message:   "acl: At least one ACL entry missing onType" }.freeze
          ACL_INVALID_ROLE_ID          = { code:      4014,
                                           http_code: 400,
                                           message:   "acl: At least one ACL entry has an invalid roleId" }.freeze
          ACL_WRONG_CUSTOMER           = { code:      4015,
                                           http_code: 400,
                                           message:   "acl: Wrong customer in ACL entry: [customerId]" }.freeze
          ACL_UNKNOWN_FOLDER           = { code:      4016,
                                           http_code: 400,
                                           message:   "acl: Unknown folder ID in ACL entry: [folderId]" }.freeze
          ACL_UNKNOWN_LOCATION_ID      = { code:      4017,
                                           http_code: 400,
                                           message:   "acl: Unknown location ID in ACL entry: [locationId]" }.freeze
          ACL_LOCATION_NOT_IN_CUSTOMER = { code:      4018,
                                           http_code: 400,
                                           message:   "acl: Location in ACL entry is not in this customer: [locationId]" }.freeze
          USER_ID_TOO_LONG             = { code:      4019,
                                           http_code: 400,
                                           message:   "id: The field id is too long; maximum size is 50" }.freeze
          FIRST_NAME_TOO_LONG          = { code:      4020,
                                           http_code: 400,
                                           message:   "firstName: The field firstName is too long; maximum size is 80" }.freeze
          LAST_NAME_TOO_LONG           = { code:      4021,
                                           http_code: 400,
                                           message:   "lastName: The field lastName is too long; maximum size is 80" }.freeze
          USERNAME_TOO_LONG            = { code:      4022,
                                           http_code: 400,
                                           message:   "username: The field username is too long; maximum size is 80" }.freeze
          USER_EMAIL_TOO_LONG          = { code:      4023,
                                           http_code: 400,
                                           message:   "emailAddress: The field emailAddress is too long; maximum size is 255" }.freeze
          COUNTRY_TOO_LONG             = { code:      4024,
                                           http_code: 400,
                                           message:   "country: The field country is too long; maximum size is 2" }.freeze
          PASSWORD_TOO_LONG            = { code:      4025,
                                           http_code: 400,
                                           message:   "password: The field password is too long; maximum size is 30" }.freeze
          USER_EMAIL_INVALID           = { code:      4026,
                                           http_code: 400,
                                           message:   "emailAddress: The field emailAddress is not a valid email" }.freeze
          USER_FIRST_NAME_REQUIRED     = { code:      4027,
                                           http_code: 400,
                                           message:   "firstName: The field firstName is required" }.freeze
          USER_LAST_NAME_REQUIRED      = { code:      4028,
                                           http_code: 400,
                                           message:   "lastName: The field lastName is required" }.freeze
          USER_EMAIL_REQUIRED          = { code:      4029,
                                           http_code: 400,
                                           message:   "emailAddress: The field emailAddress is required" }.freeze
          USER_FIRST_NAME_EMPTY        = { code:      4030,
                                           http_code: 400,
                                           message:   "firstName: The field firstName cannot be empty" }.freeze
          USER_LAST_NAME_EMPTY         = { code:      4031,
                                           http_code: 400,
                                           message:   "lastName: The field lastName cannot be empty" }.freeze
          USER_EMAIL_EMPTY             = { code:      4032,
                                           http_code: 400,
                                           message:   "emailAddress: The field emailAddress cannot be empty" }.freeze
          USER_COUNTRY_EMPTY           = { code:      4033,
                                           http_code: 400,
                                           message:   "country: The field country cannot be empty" }.freeze
          USER_SSO_NOT_ENABLED         = { code:      4034,
                                           http_code: 400,
                                           message:   "sso: You do not have SSO enabled for this business" }.freeze
          USERNAME_REQUIRED            = { code:      4035,
                                           http_code: 400,
                                           message:   "username: The field username is required" }.freeze
          ACL_UNKNOWN_ACCOUNT_ID       = { code:      4036,
                                           http_code: 400,
                                           message:   "acl: Unknown account ID in ACL entry: {0}.freeze" }.freeze
          USER_PHONE_INVALID           = { code:      4037,
                                           http_code: 400,
                                           message:   "phoneNumber: Not a valid phone number" }.freeze
        end
        # rubocop:enable Metrics/ModuleLength
      end
    end
  end
end
