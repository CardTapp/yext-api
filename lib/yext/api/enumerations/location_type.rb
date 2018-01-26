# frozen_string_literal: true

module Yext
  module Api
    module Enumerations
      # An enumeration class to contain the allowable values for the status of an AddRequest
      class LocationType
        include Yext::Api::Concerns::EnumAll

        LOCATION                = "LOCATION"
        HEALTHCARE_PROFESSIONAL = "HEALTHCARE_PROFESSIONAL"
        HEALTHCARE_FACILITY     = "HEALTHCARE_FACILITY"
        RESTAURANT              = "RESTAURANT"
        ATM                     = "ATM"
      end
    end
  end
end
