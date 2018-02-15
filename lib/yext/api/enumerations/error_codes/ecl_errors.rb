# frozen_string_literal: true

module Yext
  module Api
    module Enumerations
      class ErrorCodes
        # ECL error codes
        #
        # http://developer.yext.com/docs/error-messages/#ecl-errors
        module EclErrors
          include Yext::Api::Concerns::EnumAll

          LIST_LABEL_INDETERMINATE          = 6000
          LIST_LABEL_DOES_NOT_EXIST         = 6001
          LIST_LABEL_EXCEEDED_MAX_LENGTH    = 6002
          LIST_LABEL_UPDATE_FAILURE         = 6003
          COULD_NOT_LOCATE_LIST             = 6004
          UNABLE_TO_PARSE_LIST              = 6005
          LIST_ALREADY_EXISTS_WITH_ID       = 6006
          LIST_ALREADY_EXISTS_WITH_NAME     = 6007
          ERROR_DELETING_LISTS              = 6008
          LIST_IDS_DO_NOT_MATCH             = 6009
          CERTIFICATION_ITEM_TOO_LONG       = 6010
          DUPLICATE_ID_CODE_IN_LIST         = 6011
          EDUCATION_ITEM_TOO_LONG           = 6012
          END_TIME_TOO_EARLY                = 6013
          END_TIME_TOO_LATE                 = 6014
          EVENT_TYPE_TOO_LONG               = 6015
          FIXED_PRICE_TOO_HIGH              = 6016
          FIXED_PRICE_TOO_LOW               = 6017
          HIGH_PRICE_NOT_SPECIFIED          = 6018
          HIGH_PRICE_TOO_HIGH               = 6019
          HIGH_PRICE_TOO_LOW                = 6020
          ID_CODE_TOO_LONG                  = 6021
          INVALID_END_TIME                  = 6022
          INVALID_ID_CODE                   = 6023
          INVALID_PHOTO                     = 6024
          INVALID_PHOTOS                    = 6025
          INVALID_START_TIME                = 6026
          INVALID_URL                       = 6027
          INVALID_VIDEO_URL                 = 6028
          ITEM_DESCRIPTION_TOO_LONG         = 6029
          ITEM_NAME_NOT_SPECIFIED           = 6030
          ITEM_NAME_TOO_LONG                = 6031
          LIST_NAME_NOT_SPECIFIED           = 6032
          LIST_NAME_TOO_LONG                = 6033
          LIST_TITLE_NOT_SPECIFIED          = 6034
          LIST_TITLE_TOO_LONG               = 6035
          LIST_TYPE_NOT_SPECIFIED           = 6036
          LOW_PRICE_GREATER_THAN_HIGH_PRICE = 6037
          LOW_PRICE_NOT_SPECIFIED           = 6038
          LOW_PRICE_TOO_HIGH                = 6039
          LOW_PRICE_TOO_LOW                 = 6040
          PRICE_TEXT_TOO_LONG               = 6041
          PRICE_OPTION_TEXT_TOO_LONG        = 6042
          SECTION_DESCRIPTION_TOO_LONG      = 6043
          SECTION_NAME_NOT_SPECIFIED        = 6044
          SECTION_NAME_TOO_LONG             = 6045
          SERVICE_ITEM_TOO_LONG             = 6046
          START_TIME_AFTER_END_TIME         = 6047
          START_TIME_NOT_SPECIFIED          = 6048
          START_TIME_TOO_EARLY              = 6049
          START_TIME_TOO_LATE               = 6050
          TITLE_TOO_LONG                    = 6051
          TOO_MANY_CERTIFICATION_ITEMS      = 6052
          TOO_MANY_EDUCATION_ITEMS          = 6053
          TOO_MANY_GALLERY_IMAGES           = 6054
          TOO_MANY_ITEMS                    = 6055
          TOO_MANY_EVENTS                   = 6056
          TOO_MANY_PRICE_OPTIONS            = 6057
          TOO_MANY_SECTIONS                 = 6058
          TOO_MANY_SERVICE_ITEMS            = 6059
          URL_TOO_LONG                      = 6060
          MALFORMED_ECL_CONTENT             = 6061
          LIST_UNEXPECTED_ERROR             = 6062
          LIST_LANGUAGE_DISABLED            = 6063
          LIST_HAS_NO_SECTIONS              = 6064
        end
      end
    end
  end
end
