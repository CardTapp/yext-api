# frozen_string_literal: true

module Yext
  module Api
    module Enumerations
      class ErrorCodes
        # User error codes
        #
        # http://developer.yext.com/docs/error-messages/#users-errors
        module UsersErrors
          include Yext::Api::Concerns::EnumAll

          USER_NOT_FOUND               = 4000
          USER_CANNNOT_DELETE_SELF     = 4001
          USER_OWNS_CUSTOMERS          = 4002
          USER_OWNS_FOLDERS            = 4003
          USER_OWNS_LOCATIONS          = 4004
          USER_ID_REQUIRED             = 4005
          USER_ID_TAKEN                = 4006
          CANNOT_CHANGE_USER_ID        = 4007
          USERNAME_NONEMPTY            = 4008
          USERNAME_ILLEGAL_CHARS       = 4009
          USERNAME_TAKEN               = 4010
          ACL_MISSING_ROLE_ID          = 4011
          ACL_MISSING_ON               = 4012
          ACL_MISSING_ON_TYPE          = 4013
          ACL_INVALID_ROLE_ID          = 4014
          ACL_WRONG_CUSTOMER           = 4015
          ACL_UNKNOWN_FOLDER           = 4016
          ACL_UNKNOWN_LOCATION_ID      = 4017
          ACL_LOCATION_NOT_IN_CUSTOMER = 4018
          USER_ID_TOO_LONG             = 4019
          FIRST_NAME_TOO_LONG          = 4020
          LAST_NAME_TOO_LONG           = 4021
          USERNAME_TOO_LONG            = 4022
          USER_EMAIL_TOO_LONG          = 4023
          COUNTRY_TOO_LONG             = 4024
          PASSWORD_TOO_LONG            = 4025
          USER_EMAIL_INVALID           = 4026
          USER_FIRST_NAME_REQUIRED     = 4027
          USER_LAST_NAME_REQUIRED      = 4028
          USER_EMAIL_REQUIRED          = 4029
          USER_FIRST_NAME_EMPTY        = 4030
          USER_LAST_NAME_EMPTY         = 4031
          USER_EMAIL_EMPTY             = 4032
          USER_COUNTRY_EMPTY           = 4033
          USER_SSO_NOT_ENABLED         = 4034
          USERNAME_REQUIRED            = 4035
          ACL_UNKNOWN_ACCOUNT_ID       = 4036
          USER_PHONE_INVALID           = 4037
        end
      end
    end
  end
end
