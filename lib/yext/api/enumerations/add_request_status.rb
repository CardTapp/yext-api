# frozen_string_literal: true

module Yext
  module Api
    module Enumerations
      # An enumeration class to contain the allowable values for the status of an AddRequest
      class AddRequestStatus
        include Yext::Api::Concerns::EnumAll

        SUBMITTED  = "SUBMITTED"
        PROCESSING = "PROCESSING"
        COMPLETE   = "COMPLETE"
        CANCELED   = "CANCELED"
        REVIEW     = "REVIEW"
        FAILED     = "FAILED"
      end
    end
  end
end
