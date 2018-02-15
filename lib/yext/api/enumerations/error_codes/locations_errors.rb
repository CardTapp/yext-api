# frozen_string_literal: true

module Yext
  module Api
    module Enumerations
      class ErrorCodes
        # Locations error codes
        #
        # http://developer.yext.com/docs/error-messages/#locations-errors

        # rubocop:disable Metrics/ModuleLength
        module LocationsErrors
          include Yext::Api::Concerns::EnumAll

          LOCATION_NOT_FOUND                                = { code:      2000,
                                                                http_code: 400,
                                                                message:   "Location not found: [locationId]" }.freeze
          CANNOT_ACCESS_LOCATION                            = { code:      2001,
                                                                http_code: 403,
                                                                message:   "Trying to access location belonging to another business." }.freeze
          PROFILE_DOES_NOT_EXIST_FOR_LANGUAGE               = { code:      2002,
                                                                http_code: 404,
                                                                message:   "Profile does not exist for language: [localeCode]" }.freeze
          CANNOT_REMOVE_PRIMARY_PROFILE                     = { code:      2003,
                                                                http_code: 400,
                                                                message:   "Cannot remove primary profile: [localeCode]" }.freeze
          INVALID_START_VALUE                               = { code:      2004,
                                                                http_code: 400,
                                                                message:   "start cannot be less than 0" }.freeze
          INVALID_LIMIT_VALUE                               = { code:      2005,
                                                                http_code: 400,
                                                                message:   "limit cannot be less than 0" }.freeze
          LOCATION_NOT_UPDATED                              = { code:      2006,
                                                                http_code: 400,
                                                                message:   "location not updated: [location]" }.freeze
          LANGUAGE_PROFILES_NOT_ENABLED                     = { code:      2007,
                                                                http_code: 400,
                                                                message:   "Cannot process request: multi-language feature not enabled" }.freeze
          DUPLICATE_LOCATION_ID                             = { code:      2008,
                                                                http_code: 403,
                                                                message:   "Found duplicated Store ID: [storeId]. Please fix it or " \
                                                                               "contact support" }.freeze
          ERROR_LOADING_PHOTO                               = { code:      2009,
                                                                http_code: 400,
                                                                message:   "Error loading photo" }.freeze
          INVALID_KEYWORD                                   = { code:      2010,
                                                                http_code: 400,
                                                                message:   "Keyword field '[keywordField]' is not valid for this location." }.freeze
          CUSTOM_KEYWORD_VALUES                             = { code:      2011,
                                                                http_code: 400,
                                                                message:   "Keyword custom values are not allowed for field " \
                                                                               "'[keywordField]'." }.freeze
          NON_EXISTENT_KEYWORD_OPTION                       = { code:      2012,
                                                                http_code: 400,
                                                                message:   "Keyword option '[option]' does not exist for field " \
                                                                               "[keywordField]." }.freeze
          KEYWORD_LIMIT_EXCEEDED                            = { code:      2013,
                                                                http_code: 400,
                                                                message:   "The count of (custom fields + options) for field: '[keywordField]' " \
                                                                               "is greater than the allowed limit [keywordFieldLimit]." }.freeze
          LOCATION_UPDATE_FAILED                            = { code:      2014,
                                                                http_code: 400,
                                                                message:   "Location update failed" }.freeze
          LOCATION_UNKNOWN_FOLDER                           = { code:      2015,
                                                                http_code: 400,
                                                                message:   "Unknown folder [folderId]" }.freeze
          LOCATION_VALIDATION_FAILED                        = { code:      2016,
                                                                http_code: 400,
                                                                message:   "Location validation failed" }.freeze
          LOCATION_ID_TAKEN                                 = { code:      2017,
                                                                http_code: 400,
                                                                message:   "Location with id [locationId] already exists" }.freeze
          CANNOT_CHANGE_LOCATION_ID                         = { code:      2018,
                                                                http_code: 400,
                                                                message:   "You are not allowed to change a location's id" }.freeze
          LOCATION_EMAIL_NULL                               = { code:      2019,
                                                                http_code: 400,
                                                                message:   "Another location already exists with the same id" }.freeze
          LOCATION_ID_MAX                                   = { code:      2020,
                                                                http_code: 400,
                                                                message:   "Location id exceeds maximum of 64 characters" }.freeze
          LOCATION_ID_LATIN1                                = { code:      2021,
                                                                http_code: 400,
                                                                message:   "Only Latin1 characters are allowed in locationId" }.freeze
          LOCATION_ID_TOO_LONG                              = { code:      2022,
                                                                http_code: 400,
                                                                message:   "id: The field id is too long; maximum size is 50" }.freeze
          LOCATION_NAME_TOO_LONG                            = { code:      2023,
                                                                http_code: 400,
                                                                message:   "locationName: The field locationName is too long; " \
                                                                               "maximum size is 100" }.freeze
          LOCATION_ADDRESS_TOO_LONG                         = { code:      2024,
                                                                http_code: 400,
                                                                message:   "address: The field address is too long; maximum size is 255" }.freeze
          LOCATION_ADDRESS2_TOO_LONG                        = { code:      2025,
                                                                http_code: 400,
                                                                message:   "address2: The field address2 is too long; maximum size is 255" }.freeze
          LOCATION_DISPLAY_ADDRESS_TOO_LONG                 = { code:      2026,
                                                                http_code: 400,
                                                                message:   "displayAddress: The field displayAddress is too long; maximum " \
                                                                               "size is 255" }.freeze
          LOCATION_SUBLOCALITY_TOO_LONG                     = { code:      2027,
                                                                http_code: 400,
                                                                message:   "sublocality: The field sublocality is too long; maximum size " \
                                                                               "is 255" }.freeze
          LOCATION_CITY_TOO_LONG                            = { code:      2028,
                                                                http_code: 400,
                                                                message:   "city: The field city is too long; maximum size is 80" }.freeze
          LOCATION_STATE_TOO_LONG                           = { code:      2029,
                                                                http_code: 400,
                                                                message:   "state: The field state is too long; maximum size is 80" }.freeze
          LOCATION_ZIP_TOO_LONG                             = { code:      2030,
                                                                http_code: 400,
                                                                message:   "zip: The field zip is too long; maximum size is 10" }.freeze
          LOCATION_COUNTRY_TOO_LONG                         = { code:      2031,
                                                                http_code: 400,
                                                                message:   "countryCode: The field countryCode is too long; " \
                                                                               "maximum size is 2" }.freeze
          LOCATION_COUNTRY_INVALID                          = { code:      2032,
                                                                http_code: 400,
                                                                message:   "location.countryCode: Incorrect value" }.freeze
          LOCATION_LANGUAGE_TOO_LONG                        = { code:      2033,
                                                                http_code: 400,
                                                                message:   "language: The field language is too long; " \
                                                                               "maximum size is 10" }.freeze
          LOCATION_SPECIAL_OFFER_TOO_LONG                   = { code:      2034,
                                                                http_code: 400,
                                                                message:   "specialOffer: The field specialOffer is too long; " \
                                                                               "maximum size is 50" }.freeze
          LOCATION_SPECIAL_OFFER_URL_TOO_LONG               = { code:      2035,
                                                                http_code: 400,
                                                                message:   "specialOfferUrl: The field specialOfferUrl is too " \
                                                                               "long; maximum size is 255" }.freeze
          LOCATION_WEBSITE_TOO_LONG                         = { code:      2036,
                                                                http_code: 400,
                                                                message:   "websiteUrl: The field websiteUrl is too long; " \
                                                                               "maximum size is 255" }.freeze
          LOCATION_DISPLAY_WEBSITE_TOO_LONG                 = { code:      2037,
                                                                http_code: 400,
                                                                message:   "displayWebsiteUrl: The field displayWebsiteUrl is " \
                                                                               "too long; maximum size is 255" }.freeze
          LOCATION_RESERVATION_WEBSITE_TOO_LONG             = { code:      2038,
                                                                http_code: 400,
                                                                message:   "reservationUrl: The field reservationUrl is too " \
                                                                               "long; maximum size is 255" }.freeze
          LOCATION_DESCRIPTION_TOO_LONG                     = { code:      2039,
                                                                http_code: 400,
                                                                message:   "description: The field description is too long; " \
                                                                               "maximum size is 2000" }.freeze
          LOCATION_ADDITIONAL_HOURS_TOO_LONG                = { code:      2040,
                                                                http_code: 400,
                                                                message:   "additionalHoursText: The field additionalHoursText " \
                                                                               "is too long; maximum size is 255" }.freeze
          LOCATION_YEAR_TOO_LONG                            = { code:      2041,
                                                                http_code: 400,
                                                                message:   "yearEstablished: The field yearEstablished is " \
                                                                               "too long; maximum size is 4" }.freeze
          LOCATION_TWITTER_TOO_LONG                         = { code:      2042,
                                                                http_code: 400,
                                                                message:   "twitterHandle: The field twitterHandle is too " \
                                                                               "long; maximum size is 50" }.freeze
          LOCATION_FACEBOOK_TOO_LONG                        = { code:      2043,
                                                                http_code: 400,
                                                                message:   "facebookPageUrl: The field facebookPageUrl " \
                                                                               "is too long; maximum size is 255" }.freeze
          LOCATION_FB_COVER_URL_REQUIRED                    = { code:      2044,
                                                                http_code: 400,
                                                                message:   "facebookCoverPhoto.url: The field " \
                                                                               "facebookCoverPhoto.url is required" }.freeze
          LOCATION_FB_COVER_URL_TOO_LONG                    = { code:      2045,
                                                                http_code: 400,
                                                                message:   "facebookCoverPhoto.url: The field " \
                                                                               "facebookCoverPhoto.url is too long; maximum size is 255" }.freeze
          LOCATION_FB_COVER_URL_INVALID                     = { code:      2046,
                                                                http_code: 400,
                                                                message:   "facebookCoverPhoto.url: The field " \
                                                                               "facebookCoverPhoto.url is invalid" }.freeze
          LOCATION_FACEBOOK_COVER_DESCRIPTION_TOO_LONG      = { code:      2047,
                                                                http_code: 400,
                                                                message:   "facebookCoverPhoto.description: The field " \
                                                                               "facebookCoverPhoto.description is too long; " \
                                                                               "maximum size is 512" }.freeze
          LOCATION_FB_PROFILE_PIC_URL_REQUIRED              = { code:      2048,
                                                                http_code: 400,
                                                                message:   "facebookProfilePicture.url: The field " \
                                                                               "facebookProfilePicture.url is required" }.freeze
          LOCATION_FB_PROFILE_PIC_URL_TOO_LONG              = { code:      2049,
                                                                http_code: 400,
                                                                message:   "facebookProfilePicture.url: The field " \
                                                                               "facebookProfilePicture.url is too long; maximum size is 255" }.freeze
          LOCATION_FB_PROFILE_PIC_URL_INVALID               = { code:      2050,
                                                                http_code: 400,
                                                                message:   "facebookProfilePicture.url: The field " \
                                                                               "facebookProfilePicture.url is invalid" }.freeze
          LOCATION_FACEBOOK_PROFILE_DESCRIPTION_TOO_LONG    = { code:      2051,
                                                                http_code: 400,
                                                                message:   "facebookProfilePicture.description: The field " \
                                                                               "facebookProfilePicture.description is too long; " \
                                                                               "maximum size is 512" }.freeze
          LOCATION_ASSOCIATIONS_EMPTY_ELEMENT               = { code:      2052,
                                                                http_code: 400,
                                                                message:   "location.associations: The list location.associations " \
                                                                               "contains an empty element" }.freeze
          LOCATION_BRANDS_EMPTY_ELEMENT                     = { code:      2053,
                                                                http_code: 400,
                                                                message:   "location.brands: The list location.brands contains an " \
                                                                               "empty element" }.freeze
          LOCATION_KEYWORDS_EMPTY_ELEMENT                   = { code:      2054,
                                                                http_code: 400,
                                                                message:   "location.keywords: The list location.keywords contains an " \
                                                                               "empty element" }.freeze
          LOCATION_LANGUAGES_EMPTY_ELEMENT                  = { code:      2055,
                                                                http_code: 400,
                                                                message:   "location.languages: The list location.languages contains an " \
                                                                               "empty element" }.freeze
          LOCATION_PRODUCTS_EMPTY_ELEMENT                   = { code:      2056,
                                                                http_code: 400,
                                                                message:   "location.products: The list location.products contains an " \
                                                                               "empty element" }.freeze
          LOCATION_SERVICES_EMPTY_ELEMENT                   = { code:      2057,
                                                                http_code: 400,
                                                                message:   "location.services: The list location.services contains an " \
                                                                               "empty element" }.freeze
          LOCATION_SPECIALTIES_EMPTY_ELEMENT                = { code:      2058,
                                                                http_code: 400,
                                                                message:   "location.specialties: The list location.specialties contains " \
                                                                               "an empty element" }.freeze
          LOCATION_ASSOCIATIONS_LARGE_ELEMENT               = { code:      2059,
                                                                http_code: 400,
                                                                message:   "location.associations: Each element in location.associations " \
                                                                               "can be at most 100 characters long" }.freeze
          LOCATION_BRANDS_LARGE_ELEMENT                     = { code:      2060,
                                                                http_code: 400,
                                                                message:   "location.brands: Each element in location.brands can be at " \
                                                                               "most 100 characters long" }.freeze
          LOCATION_KEYWORDS_LARGE_ELEMENT                   = { code:      2061,
                                                                http_code: 400,
                                                                message:   "location.keywords: Each element in location.keywords can be " \
                                                                               "at most 100 characters long" }.freeze
          LOCATION_LANGUAGES_LARGE_ELEMENT                  = { code:      2062,
                                                                http_code: 400,
                                                                message:   "location.languages: Each element in location.languages can be " \
                                                                               "at most 100 characters long" }.freeze
          LOCATION_PRODUCTS_LARGE_ELEMENT                   = { code:      2063,
                                                                http_code: 400,
                                                                message:   "location.products: Each element in location.products can be " \
                                                                               "at most 100 characters long" }.freeze
          LOCATION_SERVICES_LARGE_ELEMENT                   = { code:      2064,
                                                                http_code: 400,
                                                                message:   "location.services: Each element in location.services can be " \
                                                                               "at most 100 characters long" }.freeze
          LOCATION_SPECIALTIES_LARGE_ELEMENT                = { code:      2065,
                                                                http_code: 400,
                                                                message:   "location.specialties: Each element in location.specialties " \
                                                                               "can be at most 100 characters long" }.freeze
          LOCATION_ID_REQUIRED                              = { code:      2066,
                                                                http_code: 400,
                                                                message:   "id: The field id is required" }.freeze
          LOCATION_NAME_REQUIRED                            = { code:      2067,
                                                                http_code: 400,
                                                                message:   "locationName: The field locationName is required" }.freeze
          LOCATION_PHONE_REQUIRED                           = { code:      2068,
                                                                http_code: 400,
                                                                message:   "location.phone: The field location.phone is required" }.freeze
          LOCATION_COUNTRY_NOT_ELIGIBLE                     = { code:      2069,
                                                                http_code: 400,
                                                                message:   "countryCode: Country is not eligible" }.freeze
          LOCATION_COUNTRY_NOT_MUTABLE                      = { code:      2070,
                                                                http_code: 400,
                                                                message:   "countryCode: Cannot change the country for a location" }.freeze
          LOCATION_COUNTRY_NONE_ELIGIBLE                    = { code:      2071,
                                                                http_code: 400,
                                                                message:   "countryCode: Could not find eligible countries" }.freeze
          LOCATION_ADDRESS_REQUIRED                         = { code:      2072,
                                                                http_code: 400,
                                                                message:   "location.address: The field location.address is required" }.freeze
          LOCATION_ADDRESS2_REQUIRED                        = { code:      2073,
                                                                http_code: 400,
                                                                message:   "location.ddress2: The field location.address2 is required" }.freeze
          LOCATION_DISPLAY_ADDRESS_REQUIRED                 = { code:      2074,
                                                                http_code: 400,
                                                                message:   "location.displayAddress: The field location.displayAddress is " \
                                                                               "required" }.freeze
          LOCATION_CITY_REQUIRED                            = { code:      2075,
                                                                http_code: 400,
                                                                message:   "location.city: The field location.city is required" }.freeze
          LOCATION_STATE_REQUIRED                           = { code:      2076,
                                                                http_code: 400,
                                                                message:   "location.state: The field location.state is required" }.freeze
          LOCATION_ZIP_REQUIRED                             = { code:      2077,
                                                                http_code: 400,
                                                                message:   "location.zip: The field location.zip is required" }.freeze
          LOCATION_SUBLOCALITY_REQUIRED                     = { code:      2078,
                                                                http_code: 400,
                                                                message:   "location.sublocality: The field location.sublocality is required" }.freeze
          LOCATION_CATEGORIES_REQUIRED                      = { code:      2079,
                                                                http_code: 400,
                                                                message:   "categoryIds: You must provide categoryIds or partnerCategoryIds when " \
                                                                               "signing up a business" }.freeze
          LOCATION_ADDRESS_INVALID                          = { code:      2080,
                                                                http_code: 400,
                                                                message:   "address: Invalid address" }.freeze
          LOCATION_ADDRESS_PO_BOX                           = { code:      2081,
                                                                http_code: 400,
                                                                message:   "address: Cannot use POBox." }.freeze
          LOCATION_ADDRESS2_PO_BOX                          = { code:      2082,
                                                                http_code: 400,
                                                                message:   "address2: Cannot use POBox." }.freeze
          LOCATION_DISPLAY_ADDRESS_PO_BOX                   = { code:      2083,
                                                                http_code: 400,
                                                                message:   "displayAddress: Cannot use POBox." }.freeze
          LOCATION_SUBLOCALITY_INVALID                      = { code:      2084,
                                                                http_code: 400,
                                                                message:   "sublocality: Invalid sublocality" }.freeze
          LOCATION_STATE_INVALID                            = { code:      2085,
                                                                http_code: 400,
                                                                message:   "state: Invalid state." }.freeze
          LOCATION_ZIP_INVALID                              = { code:      2086,
                                                                http_code: 400,
                                                                message:   "zip: Invalid zip." }.freeze
          LOCATION_PHONE_INVALID                            = { code:      2087,
                                                                http_code: 400,
                                                                message:   "phone: Invalid phone." }.freeze
          LOCATION_LOCAL_PHONE_INVALID                      = { code:      2088,
                                                                http_code: 400,
                                                                message:   "localPhone: Invalid localPhone." }.freeze
          LOCATION_ALTERNATE_PHONE_INVALID                  = { code:      2089,
                                                                http_code: 400,
                                                                message:   "alternatePhone: Invalid alternatePhone." }.freeze
          LOCATION_FAX_PHONE_INVALID                        = { code:      2090,
                                                                http_code: 400,
                                                                message:   "faxPhone: Invalid faxPhone." }.freeze
          LOCATION_MOBILE_PHONE_INVALID                     = { code:      2091,
                                                                http_code: 400,
                                                                message:   "mobilePhone: Invalid mobilePhone." }.freeze
          LOCATION_TOLL_FREE_PHONE_INVALID                  = { code:      2092,
                                                                http_code: 400,
                                                                message:   "tollFreePhone: Invalid tollFreePhone." }.freeze
          LOCATION_TTY_PHONE_INVALID                        = { code:      2093,
                                                                http_code: 400,
                                                                message:   "ttyPhone: Invalid ttyPhone." }.freeze
          LOCATION_TRACKED_LOCAL_PHONE                      = { code:      2094,
                                                                http_code: 400,
                                                                message:   "localPhone: Must provide a local phone number when main " \
                                                                               "number is a tracked number" }.freeze
          LOCATION_LOCAL_PHONE_NON_TOLL_FREE                = { code:      2095,
                                                                http_code: 400,
                                                                message:   "localPhone: Must provide a non toll-free number for local phone" }.freeze
          LOCATION_DISPLAY_LAT_INVALID                      = { code:      2096,
                                                                http_code: 400,
                                                                message:   "displayLat: Invalid Latitude. Must be within -90 to 90" }.freeze
          LOCATION_ROUTABLE_LAT_INVALID                     = { code:      2097,
                                                                http_code: 400,
                                                                message:   "routableLat: Invalid Latitude. Must be within -90 to 90" }.freeze
          LOCATION_DISPLAY_LNG_INVALID                      = { code:      2098,
                                                                http_code: 400,
                                                                message:   "displayLng: Invalid Longitude. Must be within -180 to 180" }.freeze
          LOCATION_ROUTABLE_LNG_INVALID                     = { code:      2099,
                                                                http_code: 400,
                                                                message:   "routableLng: Invalid Longitude. Must be within -180 to 180" }.freeze
          LOCATION_CATEGORIES_BOTH_PROVIDED                 = { code:      2101,
                                                                http_code: 400,
                                                                message:   "categoryIds: You cannot provide both categoryIds and " \
                                                                               "partnerCategoryIds" }.freeze
          LOCATION_CATEGORIES_EMPTY                         = { code:      2102,
                                                                http_code: 400,
                                                                message:   "categoryIds: Location does not have any specified categories: " \
                                                                               "[locationId]" }.freeze
          LOCATION_WEBSITE_INVALID                          = { code:      2103,
                                                                http_code: 400,
                                                                message:   "websiteUrl: The url provided is invalid." }.freeze
          LOCATION_DISPLAY_WEBSITE_INVALID                  = { code:      2104,
                                                                http_code: 400,
                                                                message:   "displayWebsiteUrl: The url provided is invalid." }.freeze
          LOCATION_RESERVATION_WEBSITE_INVALID              = { code:      2105,
                                                                http_code: 400,
                                                                message:   "reservationUrl: The url provided is invalid." }.freeze
          LOCATION_SPECIAL_OFFER_WEBSITE_INVALID            = { code:      2106,
                                                                http_code: 400,
                                                                message:   "specialOfferUrl: The url provided is invalid." }.freeze
          LOCATION_VIDEO_WEBSITE_INVALID                    = { code:      2107,
                                                                http_code: 400,
                                                                message:   "videoUrl: The url provided is invalid." }.freeze
          LOCATION_EMAIL_TOO_LONG                           = { code:      2108,
                                                                http_code: 400,
                                                                message:   "email: The field email is too long; maximum size is 255" }.freeze
          LOCATION_EMAILS_MAX_EXCEEDED                      = { code:      2109,
                                                                http_code: 400,
                                                                message:   "emails: Maximum of 5 email addresses" }.freeze
          LOCATION_PROMOTIONS_MAX_EXCEEDED                  = { code:      2110,
                                                                http_code: 400,
                                                                message:   "promotions: Maximum of 5 email addresses" }.freeze
          LOCATION_IS_CLOSED_INVALID                        = { code:      2112,
                                                                http_code: 400,
                                                                message:   "location.isClosed: Invalid isClosed value '[isClosedValue]' " \
                                                                               "specified" }.freeze
          LOCATION_CLOSED_DATE_SPECIFIED                    = { code:      2113,
                                                                http_code: 400,
                                                                message:   "closeDate: Close date should not be specified if isClosed = " \
                                                                               "false" }.freeze
          LOCATION_CLOSED_DATE_INVALID                      = { code:      2114,
                                                                http_code: 400,
                                                                message:   "location.closeDate: Invalid date value '[closeDateValue]' " \
                                                                               "specified" }.freeze
          LOCATION_LOGO_URL_REQUIRED                        = { code:      2115,
                                                                http_code: 400,
                                                                message:   "logo.url: The field logo.url is required" }.freeze
          LOCATION_PHOTO_URL_REQUIRED                       = { code:      2116,
                                                                http_code: 400,
                                                                message:   "photos[i]: The field photos[i].url is required" }.freeze
          LOCATION_LIST_LABELS_INVALID                      = { code:      2117,
                                                                http_code: 400,
                                                                message:   "labels[i]: Labels are case-insensitive and must be unique" }.freeze
          PROFILE_LANGUAGE_REQUIRED                         = { code:      2118,
                                                                http_code: 400,
                                                                message:   "language: The field language is required" }.freeze
          PROFILE_LANGUAGE_USED                             = { code:      2119,
                                                                http_code: 400,
                                                                message:   "language: Location already has profile using language " \
                                                                               "'[language]'" }.freeze
          PROFILE_LANGUAGE_INELIGIBLE                       = { code:      2120,
                                                                http_code: 400,
                                                                message:   "language: Language is not eligible for business." }.freeze
          PROFILE_FIELD_RESTRICTED                          = { code:      2121,
                                                                http_code: 400,
                                                                message:   "[field]: Cannot specify field(s) in an alternate language." }.freeze
          PROFILE_FIELD_HAS_ASSET                           = { code:      2122,
                                                                http_code: 400,
                                                                message:   "[field]: Cannot edit field due to use of asset on primary " \
                                                                               "profile" }.freeze
          LOCATION_FB_COVER_NARROW                          = { code:      2123,
                                                                http_code: 400,
                                                                message:   "Cover Photo too narrow. Please upload a picture that is at " \
                                                                               "least 400 pixels wide." }.freeze
          LOCATION_FB_PROFILE_PIC_NARROW                    = { code:      2124,
                                                                http_code: 400,
                                                                message:   "Profile picture too small. Please upload a picture that is at " \
                                                                               "least 180 pixels wide." }.freeze
          LOCATION_FB_PROFILE_PIC_SHORT                     = { code:      2125,
                                                                http_code: 400,
                                                                message:   "Profile picture too small. Please upload a picture that is " \
                                                                               "at least 180 pixels tall." }.freeze
          LOCATION_HOURS_INVALID                            = { code:      2126,
                                                                http_code: 400,
                                                                message:   "location.hours: The field location.hours is not a valid " \
                                                                               "hours string" }.freeze
          LOCATION_HOLIDAY_HOURS_DATE_REQUIRED              = { code:      2127,
                                                                http_code: 400,
                                                                message:   "holidayHours[i]: Date is required (and must be non-empty)" }.freeze
          LOCATION_HOLIDAY_HOURS_HOUR_REQUIRED              = { code:      2128,
                                                                http_code: 400,
                                                                message:   "holidayHours[i]: Hours is required (and can be empty if closed)" }.freeze
          LOCATION_HOLIDAY_HOURS_DUPLICATE_DATE             = { code:      2129,
                                                                http_code: 400,
                                                                message:   "holidayHours[i]: Duplicate date specified: [date]" }.freeze
          LOCATION_HOLIDAY_HOURS_INVALID                    = { code:      2130,
                                                                http_code: 400,
                                                                message:   "holidayHours[i]: Invalid holiday hour format " \
                                                                               "([exceptionMessage])" }.freeze
          LOCATION_HOLIDAY_TIMES_DATE_REQUIRED              = { code:      2131,
                                                                http_code: 400,
                                                                message:   "holidayTimes[i]: Date is required (and must be " \
                                                                               "non-empty)" }.freeze
          LOCATION_HOLIDAY_TIMES_TIME_REQUIRED              = { code:      2132,
                                                                http_code: 400,
                                                                message:   "holidayTimes[i]: Time is required (and must be " \
                                                                               "non-empty)" }.freeze
          LOCATION_HOLIDAY_TIMES_DUPLICATE_DATE             = { code:      2133,
                                                                http_code: 400,
                                                                message:   "holidayTimes[i]: Duplicate date specified: [date]" }.freeze
          LOCATION_HOLIDAY_TIMES_INVALID                    = { code:      2134,
                                                                http_code: 400,
                                                                message:   "holidayTimes[i]: Invalid holiday time format " \
                                                                               "([exceptionMessage])" }.freeze
          LOCATION_CATEGORIES_INVALID                       = { code:      2135,
                                                                http_code: 400,
                                                                message:   "categoryIds.[categoryId]: Invalid category: [categoryId]" }.freeze
          LOCATION_CATEGORIES_UNSELECTABLE                  = { code:      2136,
                                                                http_code: 400,
                                                                message:   "categoryIds.[categoryId]: The category is not " \
                                                                               "selectable: [categoryId]" }.freeze
          LOCATION_CATEGORIES_NOT_APPLICABLE                = { code:      2137,
                                                                http_code: 400,
                                                                message:   "categoryIds: Location does not have any applicable " \
                                                                               "categories: [locationId]" }.freeze
          LOCATION_CATEGORIES_CHAIN_EXCEEDED                = { code:      2138,
                                                                http_code: 400,
                                                                message:   "categoryIds.[categoryId]: Each location can have at most " \
                                                                               "one chain category" }.freeze
          LOCATION_CATEGORIES_MAX_EXCEEDED                  = { code:      2139,
                                                                http_code: 400,
                                                                message:   "categoryIds.[categoryId]: Each location can have at most " \
                                                                               "10 shown categories" }.freeze
          LOCATION_CATEGORIES_COUNTRY_INVALID               = { code:      2140,
                                                                http_code: 400,
                                                                message:   "categoryIds.[categoryId]: Invalid category for country " \
                                                                               "[countryCode]" }.freeze
          LOCATION_LANGUAGE_INVALID                         = { code:      2141,
                                                                http_code: 400,
                                                                message:   "language: Invalid language." }.freeze
          LOCATION_LANGUAGE_INELIGIBLE                      = { code:      2142,
                                                                http_code: 400,
                                                                message:   "language: Language is not eligible for business." }.freeze
          LOCATION_LANGUAGE_UNABLE_TO_VALIDATE              = { code:      2143,
                                                                http_code: 400,
                                                                message:   "language: Unable to validate language." }.freeze
          LOCATION_LIST_ID_REQUIRED                         = { code:      2144,
                                                                http_code: 400,
                                                                message:   "Missing list id" }.freeze
          LOCATION_LIST_ID_NONEXISTENT                      = { code:      2145,
                                                                http_code: 400,
                                                                message:   "List with id [listId] does not exist." }.freeze
          LOCATION_LIST_ID_DUPLICATE                        = { code:      2146,
                                                                http_code: 400,
                                                                message:   "Duplicate list ID ([listId]) specifed in update" }.freeze
          LOCATION_LIST_TOO_MANY                            = { code:      2147,
                                                                http_code: 400,
                                                                message:   "A location can be associated with at most 5 [listType]" }.freeze
          LOCATION_LIST_LABEL_NONEXISTENT                   = { code:      2148,
                                                                http_code: 400,
                                                                message:   "listLabels: List type '[type]' does not exist. Type must be " \
                                                                               "one of [BIOS, EVENTS, MENU, PRODUCTS]" }.freeze
          LOCATION_LIST_LABEL_TOO_LONG                      = { code:      2149,
                                                                http_code: 400,
                                                                message:   "listLabels.[type]: The field listLabels.[type] is too long; " \
                                                                               "maximum size is 30" }.freeze
          LOCATION_CUSTOM_FIELDS_INVALID_BOOLEAN            = { code:      2150,
                                                                http_code: 400,
                                                                message:   "customFields: Custom field [field] invalid boolean: [boolValue]" }.freeze
          LOCATION_CUSTOM_FIELDS_TEXT_LIMIT                 = { code:      2151,
                                                                http_code: 400,
                                                                message:   "customFields: Custom field [field] has 255 character max" }.freeze
          LOCATION_CUSTOM_FIELDS_INVALID_DATE               = { code:      2152,
                                                                http_code: 400,
                                                                message:   "customFields: Custom field [field] is not a valid date in " \
                                                                               "the MM/dd/YYYY format: [dateValue]" }.freeze
          LOCATION_CUSTOM_FIELDS_INVALID_NUMBER             = { code:      2153,
                                                                http_code: 400,
                                                                message:   "customFields: Custom field [field] is not a valid number: " \
                                                                               "[numValue]" }.freeze
          LOCATION_CUSTOM_FIELDS_EMPTY_HOURS                = { code:      2154,
                                                                http_code: 400,
                                                                message:   "customFields: Custom field [field] hours cannot be empty" }.freeze
          LOCATION_CUSTOM_FIELDS_HOURS_INVALID              = { code:      2155,
                                                                http_code: 400,
                                                                message:   "customFields: Custom field [field] hours format invalid: " \
                                                                               "[hours]" }.freeze
          LOCATION_CUSTOM_FIELDS_HOURS_TOO_LONG             = { code:      2156,
                                                                http_code: 400,
                                                                message:   "customFields: Custom field [field] additional hours text " \
                                                                               "has 255 character max" }.freeze
          LOCATION_CUSTOM_FIELDS_EMPTY_DAILY_TIMES          = { code:      2157,
                                                                http_code: 400,
                                                                message:   "customFields: Custom field [field] dailyTimes cannot be empty" }.freeze
          LOCATION_CUSTOM_FIELDS_DAILY_TIMES_INVALID        = { code:      2158,
                                                                http_code: 400,
                                                                message:   "customFields: Custom field [field] daily times format invalid: " \
                                                                               "[dailyTimes]" }.freeze
          LOCATION_CUSTOM_FIELDS_MULTILINE_LIMIT            = { code:      2159,
                                                                http_code: 400,
                                                                message:   "customFields: Custom field [field] has 4000 character max" }.freeze
          LOCATION_CUSTOM_FIELDS_INVALID_URL                = { code:      2160,
                                                                http_code: 400,
                                                                message:   "customFields: Custom field [field] url format invalid: " \
                                                                               "[urlValue]" }.freeze
          LOCATION_CUSTOM_FIELDS_TOO_MANY_ITEMS             = { code:      2161,
                                                                http_code: 400,
                                                                message:   "customFields: Custom field [field] can have at most 1000 items" }.freeze
          LOCATION_CUSTOM_FIELDS_EMPTY_ITEMS                = { code:      2162,
                                                                http_code: 400,
                                                                message:   "customFields: Custom field [field] cannot have empty items" }.freeze
          LOCATION_CUSTOM_FIELDS_MAX_CHARS                  = { code:      2163,
                                                                http_code: 400,
                                                                message:   "customFields: Custom field [field] items may have 100 " \
                                                                               "characters max" }.freeze
          LOCATION_CUSTOM_FIELDS_PHOTO_URL_REQUIRED         = { code:      2164,
                                                                http_code: 400,
                                                                message:   "customFields: Custom field [field] URL is required" }.freeze
          LOCATION_CUSTOM_FIELDS_GALLERY_URL_REQUIRED       = { code:      2165,
                                                                http_code: 400,
                                                                message:   "customFields: Custom field [field] photo [i]: URL is required" }.freeze
          LOCATION_CUSTOM_FIELDS_INVALID_OPTION             = { code:      2166,
                                                                http_code: 400,
                                                                message:   "customFields: Custom field [field] is not a valid option ID: " \
                                                                               "[optionValue]" }.freeze
          LOCATION_CUSTOM_FIELDS_INVALID_OPTIONS            = { code:      2167,
                                                                http_code: 400,
                                                                message:   "customFields: Custom field [field] contains an invalid option ID: " \
                                                                               "[optionValue]" }.freeze
          LOCATION_CUSTOM_FIELDS_UNALLOWED_OPTION           = { code:      2168,
                                                                http_code: 400,
                                                                message:   "customFields: Custom field [field] is not one of the allowed option " \
                                                                               "IDs: [acceptableOptions]" }.freeze
          LOCATION_CUSTOM_FIELDS_UNALLOWED_OPTIONS          = { code:      2169,
                                                                http_code: 400,
                                                                message:   "customFields: Custom field [field] contains an option ([optionValue]) " \
                                                                               "that is not an allowed option ID: [acceptableOptions]" }.freeze
          LOCATION_SPECIAL_OFFER_EMPTY                      = { code:      2170,
                                                                http_code: 400,
                                                                message:   "specialOffer: specialOffer cannot be empty" }.freeze
          PROFILE_LANGUAGE_INVALID                          = { code:      2171,
                                                                http_code: 400,
                                                                message:   "Language of list ({0}.freeze) does not match profile language" }.freeze
          LOCATION_IOS_APP_URL_INVALID                      = { code:      2172,
                                                                http_code: 400,
                                                                message:   "iosAppUrl: {0}.freeze does not start with " \
                                                                               "http://itunes.apple.com/" }.freeze
          LOCATION_ANDROID_APP_URL_INVALID                  = { code:      2173,
                                                                http_code: 400,
                                                                message:   "androidAppUrl: {0}.freeze does not start with " \
                                                                               "http://play.google.com/store/apps/details?id=" }.freeze
          LOCATION_INSTAGRAM_TOO_LONG                       = { code:      2174,
                                                                http_code: 400,
                                                                message:   "instagramHandle: {0}.freeze is longer than 30 characters" }.freeze
          LOCATION_INSTAGRAM_INVALID                        = { code:      2175,
                                                                http_code: 400,
                                                                message:   "instagramHandle: {0}.freeze contains invalid characters" }.freeze
          LOCATION_WIFI_NETWORK_NAME_REQUIRED               = { code:      2176,
                                                                http_code: 400,
                                                                message:   "wifiInfo: network_name is required" }.freeze
          LOCATION_IN_STORE_COUPON_HEADLINE_REQUIRED        = { code:      2177,
                                                                http_code: 400,
                                                                message:   "inStoreCoupon: headline is required" }.freeze
          LOCATION_IN_STORE_COUPON_HEADLINE_TOO_LONG        = { code:      2178,
                                                                http_code: 400,
                                                                message:   "inStoreCoupon: headline is longer than 15 characters" }.freeze
          LOCATION_IN_STORE_COUPON_DETAIL_REQUIRED          = { code:      2179,
                                                                http_code: 400,
                                                                message:   "inStoreCoupon: detail is required" }.freeze
          LOCATION_IN_STORE_COUPON_DETAIL_TOO_LONG          = { code:      2180,
                                                                http_code: 400,
                                                                message:   "inStoreCoupon: detail is longer than 60 characters" }.freeze
          LOCATION_IN_STORE_COUPON_BARCODE_TYPE_REQUIRED    = { code:      2181,
                                                                http_code: 400,
                                                                message:   "inStoreCoupon.barcode: type is required" }.freeze
          LOCATION_IN_STORE_COUPON_BARCODE_TYPE_INVALID     = { code:      2182,
                                                                http_code: 400,
                                                                message:   "inStoreCoupon.barcode: type is invalid: {0}.freeze" }.freeze
          LOCATION_IN_STORE_COUPON_BARCODE_CONTENT_REQUIRED = { code:      2183,
                                                                http_code: 400,
                                                                message:   "inStoreCoupon.barcode: content is required" }.freeze
          LOCATION_IN_STORE_COUPON_EXPIRATION_INVALID       = { code:      2184,
                                                                http_code: 400,
                                                                message:   "inStoreCoupon.expirationDate: Invalid time format (YYYY-mm-dd)" }.freeze
          LOCATION_IN_STORE_CONTACT_TOO_LONG                = { code:      2185,
                                                                http_code: 400,
                                                                message:   "inStoreContact: {0}.freeze is longer than 100 characters" }.freeze
          PROFILE_NO_XONE                                   = { code:      2186,
                                                                http_code: 400,
                                                                message:   "Xone field included: Xone is not enabled for this account" }.freeze
          LOCATION_CUSTOM_FIELDS_VIDEO_URL_REQUIRED         = { code:      2187,
                                                                http_code: 400,
                                                                message:   "customFields: Custom field {0}.freeze video URL is required" }.freeze
          LOCATION_CUSTOM_FIELDS_VIDEO_INVALID_URL          = { code:      2188,
                                                                http_code: 400,
                                                                message:   "customFields: Custom field {0}.freeze provided URL is invalid" }.freeze
          LOCATION_CUSTOM_FIELDS_VIDEO_DESCRIPTION_TOO_LONG = { code:      2189,
                                                                http_code: 400,
                                                                message:   "customFields: Custom field {0}.freeze provided description " \
                                                                               "exceeds 140 character max" }.freeze
          INVALID_SEARCH_IDS                                = { code:      2190,
                                                                http_code: 400,
                                                                message:   "Invalid searchIds" }.freeze
          LOCATION_GMB_COVER_URL_REQUIRED                   = { code:      2191,
                                                                http_code: 400,
                                                                message:   "googleCoverPhoto.url: The url is required" }.freeze
          LOCATION_GMB_COVER_URL_TOO_LONG                   = { code:      2192,
                                                                http_code: 400,
                                                                message:   "googleCoverPhoto.url: The url is too long; maximum size is 255" }.freeze
          LOCATION_GMB_COVER_URL_INVALID                    = { code:      2193,
                                                                http_code: 400,
                                                                message:   "googleCoverPhoto.url: The url is invalid" }.freeze
          LOCATION_GMB_COVER_DESCRIPTION_TOO_LONG           = { code:      2194,
                                                                http_code: 400,
                                                                message:   "googleCoverPhoto.description: The description is too long; " \
                                                                               "maximum size is 512" }.freeze
          LOCATION_GMB_PROFILE_PIC_URL_REQUIRED             = { code:      2195,
                                                                http_code: 400,
                                                                message:   "googleProfilePhoto.url: The url is required" }.freeze
          LOCATION_GMB_PROFILE_PIC_URL_TOO_LONG             = { code:      2196,
                                                                http_code: 400,
                                                                message:   "googleProfilePhoto.url: The url is too long; maximum size is 255" }.freeze
          LOCATION_GMB_PROFILE_PIC_URL_INVALID              = { code:      2197,
                                                                http_code: 400,
                                                                message:   "googleProfilePhoto.url: The url is invalid" }.freeze
          LOCATION_GMB_PROFILE_DESCRIPTION_TOO_LONG         = { code:      2198,
                                                                http_code: 400,
                                                                message:   "googleProfilePhoto.description: The description is too long; " \
                                                                               "maximum size is 512" }.freeze
          LOCATION_GMB_COVER_SIZE                           = { code:      2199,
                                                                http_code: 400,
                                                                message:   "googleCoverPhoto: Size is incorrect. Please upload a picture " \
                                                                               "that is between {0}.freeze and {1}.freeze pixels wide." }.freeze
          LOCATION_GMB_COVER_RATIO                          = { code:      2200,
                                                                http_code: 400,
                                                                message:   "googleCoverPhoto: Aspect ratio is incorrect. Please upload " \
                                                                               "a picture that is {0}.freeze." }.freeze
          LOCATION_GMB_PROFILE_SIZE                         = { code:      2201,
                                                                http_code: 400,
                                                                message:   "googleProfilePhoto: Size is incorrect. Please upload a " \
                                                                               "picture that is between {0}.freeze and {1}.freeze " \
                                                                               "pixels wide." }.freeze
          LOCATION_GMB_PROFILE_RATIO                        = { code:      2202,
                                                                http_code: 400,
                                                                message:   "googleProfilePhoto: Aspect ratio is incorrect. Please " \
                                                                               "upload a picture that is {0}.freeze." }.freeze
          LOCATION_SERVICE_AREA_INVALID_RADIUS              = { code:      2203,
                                                                http_code: 400,
                                                                message:   "serviceArea.radius: Radius is invalid. Radius should " \
                                                                               "be between 0 and 50.0" }.freeze
          LOCATION_SERVICE_AREA_MISSING_UNITS               = { code:      2204,
                                                                http_code: 400,
                                                                message:   "serviceArea.unit: Missing unit" }.freeze
          LOCATION_SERVICE_AREA_INVALID_UNITS               = { code:      2205,
                                                                http_code: 400,
                                                                message:   "serviceArea.unit: Invalid unit" }.freeze
          LOCATION_SERVICE_AREA_TOO_MANY_PLACES             = { code:      2206,
                                                                http_code: 400,
                                                                message:   "serviceArea.places: Too many places provided" }.freeze
          LOCATION_GMB_WEBSITE_OVERRIDE_TOO_LONG            = { code:      2207,
                                                                http_code: 400,
                                                                message:   "googleWebsiteOverride: The url is too long; maximum size is 255" }.freeze
          LOCATION_GMB_WEBSITE_OVERRIDE_INVALID_URL         = { code:      2208,
                                                                http_code: 400,
                                                                message:   "googleWebsiteOverride: The url is invalid" }.freeze
          LOCATION_IOS_APP_BAD_URL                          = { code:      2209,
                                                                http_code: 400,
                                                                message:   "iosAppUrl: {0}.freeze is not a valid URL" }.freeze
          LOCATION_ANDROID_APP_BAD_URL                      = { code:      2210,
                                                                http_code: 400,
                                                                message:   "androidAppUrl: {0}.freeze is not a valid URL" }.freeze
          LOCATION_HOLIDAY_HOURS_PAST_DATE                  = { code:      2211,
                                                                http_code: 400,
                                                                message:   "{0}.freezeholidayHours[{1}.freeze]: Cannot set dates in the " \
                                                                               "past: {2}.freeze" }.freeze
          LOCATION_HOLIDAY_HOURS_INVALID_INTERVAL           = { code:      2212,
                                                                http_code: 400,
                                                                message:   "{0}.freezeholidayHours[{1}.freeze]: Invalid hours interval " \
                                                                               "provided" }.freeze
          LOCATION_HOURS_INVALID_INTERVAL                   = { code:      2213,
                                                                http_code: 400,
                                                                message:   "location.hours: Invalid hours interval provided for day " \
                                                                               "{0}.freeze" }.freeze
          LOCATION_CUSTOM_FIELD_HOURS_INVALID_INTERVAL      = { code:      2214,
                                                                http_code: 400,
                                                                message:   "customField.{0}.freeze.hours: Invalid hours interval " \
                                                                               "provided for day {1}.freeze" }.freeze
          LOCATION_HOLIDAY_TIMES_PAST_DATE                  = { code:      2215,
                                                                http_code: 400,
                                                                message:   "{0}.freezeholidayTimes[{1}.freeze]: Cannot set dates " \
                                                                               "in the past: {2}.freeze" }.freeze
          LOCATION_INVALID_GASSTATION_FEATURE               = { code:      2216,
                                                                http_code: 400,
                                                                message:   "{0}.freeze is not a valid station feature" }.freeze
          LOCATION_INVALID_LABEL                            = { code:      2217,
                                                                http_code: 400,
                                                                message:   "{0}.freeze is not a valid label ID" }.freeze
          LOCATION_LABEL_LOAD_FAILED                        = { code:      2218,
                                                                http_code: 500,
                                                                message:   "labelIds: There was an error fetching labels" }.freeze
          LOCATION_INVALID_GOOGLE_PREFERRED_PHOTO           = { code:      2219,
                                                                http_code: 400,
                                                                message:   "Invalid twitter handle" }.freeze
          LOCATION_INVALID_GENDER                           = { code:      2220,
                                                                http_code: 400,
                                                                message:   "gender: {0}.freeze is not a valid gender" }.freeze
          LOCATION_HEADSHOT_URL_REQUIRED                    = { code:      2221,
                                                                http_code: 400,
                                                                message:   "headshot.url: The field headshot.url is required" }.freeze
          LOCATION_INVALID_LOCATION_TYPE                    = { code:      2222,
                                                                http_code: 400,
                                                                message:   "{0}.freeze is not a valid location type" }.freeze
          LOCATION_INVALID_EDUCATION_TYPE                   = { code:      2223,
                                                                http_code: 400,
                                                                message:   "{0}.freeze is not a valid education & training type" }.freeze
          INVALID_LOCATION_TYPE                             = { code:      2224,
                                                                http_code: 400,
                                                                message:   "You cannot update the {0}.freeze field for a location with " \
                                                                               "{1}.freeze location type" }.freeze
          LOCATION_INVALID_UBER_LINK_TYPE                   = { code:      2225,
                                                                http_code: 400,
                                                                message:   "uberLinkType must be either 'Link' or 'Button'" }.freeze
          LOCATION_DUPLICATE_LANGUAGE                       = { code:      2226,
                                                                http_code: 400,
                                                                message:   "language {0}.freeze already exists for this location" }.freeze
          CANNOT_UPDATE_FACEBOOK_PAGE_URL                   = { code:      2227,
                                                                http_code: 200,
                                                                message:   "facebookPageUrl: Locations with LIVE Facebook listings " \
                                                                               "may not update facebookPageUrl." }.freeze
          SERVICE_AREA_BOTH_SPECIFIED                       = { code:      2228,
                                                                http_code: 200,
                                                                message:   "serviceArea: Requires radius or places, not both. " \
                                                                               "Defaulting to radius." }.freeze
          GALLERY_PHOTO_URL_INVALID                         = { code:      2229,
                                                                http_code: 200,
                                                                message:   "photos[{0}.freeze]: Invalid url: {1}.freeze" }.freeze
          CANNOT_LOAD_GALLERY_PHOTO                         = { code:      2230,
                                                                http_code: 200,
                                                                message:   "photos[{0}.freeze]: Error loading photo: {1}.freeze" }.freeze
          CANNOT_LOAD_PHOTO                                 = { code:      2231,
                                                                http_code: 200,
                                                                message:   "{0}.freeze: Error loading photo: {1}.freeze" }.freeze
          LOCATION_CUSTOM_FIELDS_UNKNOWN_FIELD              = { code:      2232,
                                                                http_code: 400,
                                                                message:   "customFields: Unknown custom field {0}.freeze" }.freeze
          LOCATION_CUSTOM_FIELDS_INVALID_FORMAT             = { code:      2233,
                                                                http_code: 400,
                                                                message:   "customFields: {0}.freeze is not valid for its type" }.freeze
          LOCATION_INVALID_RANK_TRACKING_FREQUENCY          = { code:      2234,
                                                                http_code: 400,
                                                                message:   "{0}.freeze is not a valid search tracking frequency" }.freeze
          LOCATION_INVALID_RANK_TRACKING_KEYWORD            = { code:      2235,
                                                                http_code: 400,
                                                                message:   "{0}.freeze is not a valid location keyword" }.freeze
          LOCATION_INVALID_RANK_TRACKING_QUERY_TEMPLATE     = { code:      2236,
                                                                http_code: 400,
                                                                message:   "{0}.freeze is not a valid query template" }.freeze
          LOCATION_INVALID_RANK_TRACKING_SITE               = { code:      2237,
                                                                http_code: 400,
                                                                message:   "{0}.freeze is not a valid tracking site" }.freeze
          LOCATION_NOT_FOUND_404                            = { code:      2238,
                                                                http_code: 404,
                                                                message:   "Location not found: {0}.freeze" }.freeze
          LOCATION_INVALID_NPI                              = { code:      2239,
                                                                http_code: 400,
                                                                message:   "{0}.freeze is not a valid NPI" }.freeze
          CUSTOM_FIELD_NO_ACCESS                            = { code:      3500,
                                                                http_code: 403,
                                                                message:   "App does not have access to custom field: {0}.freeze" }.freeze
          CUSTOM_FIELD_INVALID                              = { code:      3501,
                                                                http_code: 400,
                                                                message:   "{0}.freeze" }.freeze
          CUSTOM_FIELD_NOT_OPTION_TYPE                      = { code:      3502,
                                                                http_code: 400,
                                                                message:   "options: {0}.freeze custom field does not support options" }.freeze
          CUSTOM_FIELD_NO_GROUP                             = { code:      3503,
                                                                http_code: 400,
                                                                message:   "group: {0}.freeze does not exist for this business" }.freeze
          CUSTOM_FIELD_VALIDATION_RULE_ERROR                = { code:      3504,
                                                                http_code: 400,
                                                                message:   "{0}.freeze" }.freeze
          CUSTOM_FIELD_FIELD_TYPE_ERROR                     = { code:      3505,
                                                                http_code: 400,
                                                                message:   "{0}.freeze: Invalid custom field type" }.freeze
        end
        # rubocop:enable Metrics/ModuleLength
      end
    end
  end
end
