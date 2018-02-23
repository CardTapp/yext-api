# frozen_string_literal: true

module Yext
  module Api
    module Enumerations
      # An enumeration class to contain the possible status values for a listing.
      class ListingStatus
        include Yext::Api::Concerns::EnumAll

        WAITING_ON_YEXT      = "WAITING_ON_YEXT"
        WAITING_ON_CUSTOMER  = "WAITING_ON_CUSTOMER"
        WAITING_ON_PUBLISHER = "WAITING_ON_PUBLISHER"
        LIVE                 = "LIVE"
        UNAVAILABLE          = "UNAVAILABLE"
        OPTED_OUT            = "OPTED_OUT"
      end
    end
  end
end
