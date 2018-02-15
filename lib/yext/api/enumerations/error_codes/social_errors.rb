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

          SOCIAL_INVALID_START_VALUE                    = { code:      9000,
                                                            http_code: 400,
                                                            message:   "Invalid/missing parameters: start must be greater than 0" }.freeze
          SOCIAL_INVALID_LIMIT_VALUE                    = { code:      9001,
                                                            http_code: 400,
                                                            message:   "Invalid/missing parameters: limit must be between 0 and 100" }.freeze
          SOCIAL_INVALID_POST_TYPE                      = { code:      9002,
                                                            http_code: 400,
                                                            message:   "Invalid/missing parameters: postType must be either CONSUMERS or " \
                                                                           "BUSINESS" }.freeze
          SOCIAL_INVALID_KEYWORDS                       = { code:      9003,
                                                            http_code: 400,
                                                            message:   "Invalid/missing parameters: You can provide upto 5 keywords for " \
                                                                           "search." }.freeze
          SOCIAL_INVALID_POST_CONTENT                   = { code:      9004,
                                                            http_code: 400,
                                                            message:   "Incorrect content format: You must post either a message, link, " \
                                                                           "or photo" }.freeze
          SOCIAL_CANNOT_POST_LINK_PHOTO                 = { code:      9005,
                                                            http_code: 400,
                                                            message:   "Incorrect content format: You can't post both a link and a photo" }.freeze
          SOCIAL_PHOTO_SIZE_TOO_BIG                     = { code:      9006,
                                                            http_code: 400,
                                                            message:   "Incorrect content format: Photo size must be less than 5 MB" }.freeze
          SOCIAL_EMPTY_MSG_NOT_ACCEPTED                 = { code:      9007,
                                                            http_code: 400,
                                                            message:   "Incorrect content format: Empty message is not accepted by " \
                                                                           "[socialPartner]" }.freeze
          SOCIAL_MESSAGE_TOO_SHORT                      = { code:      9008,
                                                            http_code: 400,
                                                            message:   "Incorrect content format: Message length under [minCharacters] " \
                                                                           "characters is not accepted by [socialPartner]" }.freeze
          SOCIAL_MESSAGE_TOO_LONG                       = { code:      9009,
                                                            http_code: 400,
                                                            message:   "Incorrect content format: Message length over [maxCharacters] " \
                                                                           "characters is not accepted by [socialPartner]" }.freeze
          SOCIAL_SITE_ID_INVALID                        = { code:      9010,
                                                            http_code: 400,
                                                            message:   "Invalid/missing parameters: No site id specified" }.freeze
          SOCIAL_CUSTOMER_ID_INVALID                    = { code:      9011,
                                                            http_code: 400,
                                                            message:   "Invalid/missing parameters: No customer id specified" }.freeze
          SOCIAL_POST_ID_INVALID                        = { code:      9012,
                                                            http_code: 400,
                                                            message:   "Invalid/missing parameters: No post id specified" }.freeze
          SOCIAL_LOCATION_ID_INVALID                    = { code:      9013,
                                                            http_code: 400,
                                                            message:   "Invalid/missing parameters: No location id specified" }.freeze
          SOCIAL_MESSAGE_INVALID                        = { code:      9014,
                                                            http_code: 400,
                                                            message:   "Invalid/missing parameters: No message specified" }.freeze
          SOCIAL_LOCATIONS_INVALID                      = { code:      9015,
                                                            http_code: 400,
                                                            message:   "Invalid/missing parameters: No location(s) specified" }.freeze
          SOCIAL_SITES_INVALID                          = { code:      9016,
                                                            http_code: 400,
                                                            message:   "Invalid/missing parameters: No site(s) specified" }.freeze
          SOCIAL_LOCATION_INVALID                       = { code:      9017,
                                                            http_code: 400,
                                                            message:   "Invalid/missing parameters: No location specified" }.freeze
          SOCIAL_SITE_INVALID                           = { code:      9018,
                                                            http_code: 400,
                                                            message:   "Invalid/missing parameters: No siteId specified" }.freeze
          SOCIAL_SITE_UNSUPPORTED                       = { code:      9019,
                                                            http_code: 400,
                                                            message:   "Invalid/missing parameters: Invalid or unsupported site id: " \
                                                                           "{0}.freeze" }.freeze
          SOCIAL_LOCATION_UNSUPPORTED                   = { code:      9020,
                                                            http_code: 400,
                                                            message:   "Invalid/missing parameters: Invalid or unsupported location id: " \
                                                                           "[locationId]" }.freeze
          SOCIAL_LOCATIONS_UNSUPPORTED                  = { code:      9021,
                                                            http_code: 400,
                                                            message:   "Invalid/missing parameters: Invalid or unsupported location ids: " \
                                                                           "[locationIds]" }.freeze
          SOCIAL_INSUFFICIENT_CREATE_COMMENT_PRIVILEGES = { code:      9022,
                                                            http_code: 400,
                                                            message:   "Invalid/missing permissions: You cannot comment on this post" }.freeze
          SOCIAL_INSUFFICIENT_DELETE_COMMENT_PRIVILEGES = { code:      9023,
                                                            http_code: 400,
                                                            message:   "Invalid/missing permissions: You cannot delete this comment" }.freeze
          SOCIAL_INSUFFICIENT_DELETE_POST_PRIVILEGES    = { code:      9024,
                                                            http_code: 400,
                                                            message:   "Invalid/missing permissions: You cannot delete a post of this type" }.freeze
          SOCIAL_INSUFFICIENT_ACCESS_POST_PRIVILEGES    = { code:      9025,
                                                            http_code: 400,
                                                            message:   "Invalid/missing permissions: You don't have access to this post" }.freeze
          SOCIAL_INSUFFICIENT_LIKE_COMMENT_PRIVILEGES   = { code:      9026,
                                                            http_code: 400,
                                                            message:   "Invalid/missing permissions: You cannot like this comment" }.freeze
          SOCIAL_INSUFFICIENT_LIKE_POST_PRIVILEGES      = { code:      9027,
                                                            http_code: 400,
                                                            message:   "Invalid/missing permissions: You cannot like this post" }.freeze
          SOCIAL_POST_NON_EXISTENT                      = { code:      9028,
                                                            http_code: 400,
                                                            message:   "Invalid operation: This post does not exist or has been deleted" }.freeze
          SOCIAL_COMMENT_NON_EXISTENT                   = { code:      9029,
                                                            http_code: 400,
                                                            message:   "Invalid operation: This comment does not exist" }.freeze
        end
      end
    end
  end
end
