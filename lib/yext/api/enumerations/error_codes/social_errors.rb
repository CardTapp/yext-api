# frozen_string_literal: true

module Yext
  module Api
    module Enumerations
      class ErrorCodes
        # Social error codes
        #
        # http://developer.yext.com/docs/error-messages/#social-errors
        module SocialErrors
          include Yext::Api::Concerns::EnumAll

          SOCIAL_INVALID_START_VALUE                    = 9000
          SOCIAL_INVALID_LIMIT_VALUE                    = 9001
          SOCIAL_INVALID_POST_TYPE                      = 9002
          SOCIAL_INVALID_KEYWORDS                       = 9003
          SOCIAL_INVALID_POST_CONTENT                   = 9004
          SOCIAL_CANNOT_POST_LINK_PHOTO                 = 9005
          SOCIAL_PHOTO_SIZE_TOO_BIG                     = 9006
          SOCIAL_EMPTY_MSG_NOT_ACCEPTED                 = 9007
          SOCIAL_MESSAGE_TOO_SHORT                      = 9008
          SOCIAL_MESSAGE_TOO_LONG                       = 9009
          SOCIAL_SITE_ID_INVALID                        = 9010
          SOCIAL_CUSTOMER_ID_INVALID                    = 9011
          SOCIAL_POST_ID_INVALID                        = 9012
          SOCIAL_LOCATION_ID_INVALID                    = 9013
          SOCIAL_MESSAGE_INVALID                        = 9014
          SOCIAL_LOCATIONS_INVALID                      = 9015
          SOCIAL_SITES_INVALID                          = 9016
          SOCIAL_LOCATION_INVALID                       = 9017
          SOCIAL_SITE_INVALID                           = 9018
          SOCIAL_SITE_UNSUPPORTED                       = 9019
          SOCIAL_LOCATION_UNSUPPORTED                   = 9020
          SOCIAL_LOCATIONS_UNSUPPORTED                  = 9021
          SOCIAL_INSUFFICIENT_CREATE_COMMENT_PRIVILEGES = 9022
          SOCIAL_INSUFFICIENT_DELETE_COMMENT_PRIVILEGES = 9023
          SOCIAL_INSUFFICIENT_DELETE_POST_PRIVILEGES    = 9024
          SOCIAL_INSUFFICIENT_ACCESS_POST_PRIVILEGES    = 9025
          SOCIAL_INSUFFICIENT_LIKE_COMMENT_PRIVILEGES   = 9026
          SOCIAL_INSUFFICIENT_LIKE_POST_PRIVILEGES      = 9027
          SOCIAL_POST_NON_EXISTENT                      = 9028
          SOCIAL_COMMENT_NON_EXISTENT                   = 9029
        end
      end
    end
  end
end
