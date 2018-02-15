# frozen_string_literal: true

module Yext
  module Api
    module Enumerations
      class ErrorCodes
        # ECL error codes
        #
        # http://developer.yext.com/docs/error-messages/#ecl-errors

        # rubocop:disable Metrics/ModuleLength
        module EclErrors
          include Yext::Api::Concerns::EnumAll

          LIST_LABEL_INDETERMINATE          = { code:      6000,
                                                http_code: 400,
                                                message:   "List labels vary by location. Please access them for individual " \
                                                               "locations instead." }.freeze
          LIST_LABEL_DOES_NOT_EXIST         = { code:      6001,
                                                http_code: 400,
                                                message:   "List label type does not exist. Types must be one of [BIOS, " \
                                                               "EVENTS, MENU, PRODUCTS]" }.freeze
          LIST_LABEL_EXCEEDED_MAX_LENGTH    = { code:      6002,
                                                http_code: 400,
                                                message:   "List label cannot exceed 30 characters" }.freeze
          LIST_LABEL_UPDATE_FAILURE         = { code:      6003,
                                                http_code: 400,
                                                message:   "List label failed to update" }.freeze
          COULD_NOT_LOCATE_LIST             = { code:      6004,
                                                http_code: 404,
                                                message:   "Could not locate list with id: [listId]" }.freeze
          UNABLE_TO_PARSE_LIST              = { code:      6005,
                                                http_code: 400,
                                                message:   "Unable to parse list" }.freeze
          LIST_ALREADY_EXISTS_WITH_ID       = { code:      6006,
                                                http_code: 400,
                                                message:   "A list with already exists with id: [listId]" }.freeze
          LIST_ALREADY_EXISTS_WITH_NAME     = { code:      6007,
                                                http_code: 400,
                                                message:   "A list with already exists with name: [listName]" }.freeze
          ERROR_DELETING_LISTS              = { code:      6008,
                                                http_code: 500,
                                                message:   "Unexpected error deleting lists" }.freeze
          LIST_IDS_DO_NOT_MATCH             = { code:      6009,
                                                http_code: 400,
                                                message:   "The id specified in the url does not match the id in the content." }.freeze
          CERTIFICATION_ITEM_TOO_LONG       = { code:      6010,
                                                http_code: 400,
                                                message:   "Certification exceeds the maximum length, 200" }.freeze
          DUPLICATE_ID_CODE_IN_LIST         = { code:      6011,
                                                http_code: 400,
                                                message:   "The idCode, is not unique" }.freeze
          EDUCATION_ITEM_TOO_LONG           = { code:      6012,
                                                http_code: 400,
                                                message:   "Education exceeds the maximum length, 200" }.freeze
          END_TIME_TOO_EARLY                = { code:      6013,
                                                http_code: 400,
                                                message:   "End time preceeds the earliest start time, January 1st, 1970" }.freeze
          END_TIME_TOO_LATE                 = { code:      6014,
                                                http_code: 400,
                                                message:   "End time exceeds the maximum end time, 100 years from now" }.freeze
          EVENT_TYPE_TOO_LONG               = { code:      6015,
                                                http_code: 400,
                                                message:   "Event type exceeds the maximum length, 100" }.freeze
          FIXED_PRICE_TOO_HIGH              = { code:      6016,
                                                http_code: 400,
                                                message:   "The price has exceeded the maximum price, 1000000.0" }.freeze
          FIXED_PRICE_TOO_LOW               = { code:      6017,
                                                http_code: 400,
                                                message:   "The price is less than the minimum price, 0" }.freeze
          HIGH_PRICE_NOT_SPECIFIED          = { code:      6018,
                                                http_code: 400,
                                                message:   "A cost of type RANGE missing a required field, rangeTo" }.freeze
          HIGH_PRICE_TOO_HIGH               = { code:      6019,
                                                http_code: 400,
                                                message:   "The rangeTo has exceeded the maximum price, 1000000.0" }.freeze
          HIGH_PRICE_TOO_LOW                = { code:      6020,
                                                http_code: 400,
                                                message:   "The rangeTo is less than the minimum price, 0" }.freeze
          ID_CODE_TOO_LONG                  = { code:      6021,
                                                http_code: 400,
                                                message:   "Id code exceeds the maximum length, 20" }.freeze
          INVALID_END_TIME                  = { code:      6022,
                                                http_code: 400,
                                                message:   "The endTime could not be parsed" }.freeze
          INVALID_ID_CODE                   = { code:      6023,
                                                http_code: 400,
                                                message:   "The idCode is not valid, only numbers, letters, dashes and underscores " \
                                                               "are permitted" }.freeze
          INVALID_PHOTO                     = { code:      6024,
                                                http_code: 400,
                                                message:   "The photo url coult not be processed" }.freeze
          INVALID_PHOTOS                    = { code:      6025,
                                                http_code: 400,
                                                message:   "The photo url could not be procesed" }.freeze
          INVALID_START_TIME                = { code:      6026,
                                                http_code: 400,
                                                message:   "The startTime could not be parsed" }.freeze
          INVALID_URL                       = { code:      6027,
                                                http_code: 400,
                                                message:   "The url is not a valid url" }.freeze
          INVALID_VIDEO_URL                 = { code:      6028,
                                                http_code: 400,
                                                message:   "The video url is not a valid YouTube url" }.freeze
          ITEM_DESCRIPTION_TOO_LONG         = { code:      6029,
                                                http_code: 400,
                                                message:   "Description exceeds the maximum length, 5000" }.freeze
          ITEM_NAME_NOT_SPECIFIED           = { code:      6030,
                                                http_code: 400,
                                                message:   "An item is missing the required field, name" }.freeze
          ITEM_NAME_TOO_LONG                = { code:      6031,
                                                http_code: 400,
                                                message:   "Name exceeds the maximum length, 100" }.freeze
          LIST_NAME_NOT_SPECIFIED           = { code:      6032,
                                                http_code: 400,
                                                message:   "A list is missing the required field, name" }.freeze
          LIST_NAME_TOO_LONG                = { code:      6033,
                                                http_code: 400,
                                                message:   "Name exceeds the maximum length, 100" }.freeze
          LIST_TITLE_NOT_SPECIFIED          = { code:      6034,
                                                http_code: 400,
                                                message:   "A list is missing the required field, title" }.freeze
          LIST_TITLE_TOO_LONG               = { code:      6035,
                                                http_code: 400,
                                                message:   "Title exceeds the maximum length, 100" }.freeze
          LIST_TYPE_NOT_SPECIFIED           = { code:      6036,
                                                http_code: 400,
                                                message:   "A list is missing the required field, type" }.freeze
          LOW_PRICE_GREATER_THAN_HIGH_PRICE = { code:      6037,
                                                http_code: 400,
                                                message:   "The price field cannot be greater than or equal to rangeTo field" }.freeze
          LOW_PRICE_NOT_SPECIFIED           = { code:      6038,
                                                http_code: 400,
                                                message:   "A cost of type RANGE missing a required field, price" }.freeze
          LOW_PRICE_TOO_HIGH                = { code:      6039,
                                                http_code: 400,
                                                message:   "The price has exceeded the maximum price, 1000000.0" }.freeze
          LOW_PRICE_TOO_LOW                 = { code:      6040,
                                                http_code: 400,
                                                message:   "The price is less than the minimum price, 0" }.freeze
          PRICE_TEXT_TOO_LONG               = { code:      6041,
                                                http_code: 400,
                                                message:   "Price exceeds the maximum length, 100" }.freeze
          PRICE_OPTION_TEXT_TOO_LONG        = { code:      6042,
                                                http_code: 400,
                                                message:   "Price option text exceeds the maximum length, 50" }.freeze
          SECTION_DESCRIPTION_TOO_LONG      = { code:      6043,
                                                http_code: 400,
                                                message:   "Description exceeds the maximum length, 500" }.freeze
          SECTION_NAME_NOT_SPECIFIED        = { code:      6044,
                                                http_code: 400,
                                                message:   "A section is missing the required field, name" }.freeze
          SECTION_NAME_TOO_LONG             = { code:      6045,
                                                http_code: 400,
                                                message:   "Name exceeds the maximum length, 100" }.freeze
          SERVICE_ITEM_TOO_LONG             = { code:      6046,
                                                http_code: 400,
                                                message:   "Service exceeds the maximum length, 200" }.freeze
          START_TIME_AFTER_END_TIME         = { code:      6047,
                                                http_code: 400,
                                                message:   "Start time must occur before
        end time " }.freeze
          START_TIME_NOT_SPECIFIED          = { code:      6048,
                                                http_code: 400,
                                                message:   " An event is missing a required field, startTime " }.freeze
          START_TIME_TOO_EARLY              = { code:      6049,
                                                http_code: 400,
                                                message:   " Start time preceeds the earliest start time, January 1 st, 1970 " }.freeze
          START_TIME_TOO_LATE               = { code:      6050,
                                                http_code: 400,
                                                message:   " Start time exceeds the maximum
      end time, 100 years from now " }.freeze
          TITLE_TOO_LONG                    = { code:      6051,
                                                http_code: 400,
                                                message:   " Bio Title exceeds the maximum length, 100 " }.freeze
          TOO_MANY_CERTIFICATION_ITEMS      = { code:      6052,
                                                http_code: 400,
                                                message:   " The maximum number of certifications, 10, was exceeded " }.freeze
          TOO_MANY_EDUCATION_ITEMS          = { code:      6053,
                                                http_code: 400,
                                                message:   " The maximum number of educations, 10, was exceeded " }.freeze
          TOO_MANY_GALLERY_IMAGES           = { code:      6054,
                                                http_code: 400,
                                                message:   " The maximum number of photos, 5, was exceeded " }.freeze
          TOO_MANY_ITEMS                    = { code:      6055,
                                                http_code: 400,
                                                message:   " The maximum number of items, 100, was exceeded " }.freeze
          TOO_MANY_EVENTS                   = { code:      6056,
                                                http_code: 400,
                                                message:   " The maximum number of events, 2500, was exceeded " }.freeze
          TOO_MANY_PRICE_OPTIONS            = { code:      6057,
                                                http_code: 400,
                                                message:   " The maximum number of price options, 5, was exceeded " }.freeze
          TOO_MANY_SECTIONS                 = { code:      6058,
                                                http_code: 400,
                                                message:   " The maximum number of sections, 25, was exceeded " }.freeze
          TOO_MANY_SERVICE_ITEMS            = { code:      6059,
                                                http_code: 400,
                                                message:   " The maximum number of services, 100, was exceeded " }.freeze
          URL_TOO_LONG                      = { code:      6060,
                                                http_code: 400,
                                                message:   " Url exceeds the maximum length, 1024 " }.freeze
          MALFORMED_ECL_CONTENT             = { code:      6061,
                                                http_code: 400,
                                                message:   " Some content in the ECL is malformed " }.freeze
          LIST_UNEXPECTED_ERROR             = { code:      6062,
                                                http_code: 500,
                                                message:   " Unexpected error updating lists " }.freeze
          LIST_LANGUAGE_DISABLED            = { code:      6063,
                                                http_code: 400,
                                                message:   "Language not enabled for business: [language]" }.freeze
          LIST_HAS_NO_SECTIONS              = { code:      6064,
                                                http_code: 400,
                                                message:   " At least one section is required " }.freeze
        end
        # rubocop:enable Metrics/ModuleLength
      end
    end
  end
end
