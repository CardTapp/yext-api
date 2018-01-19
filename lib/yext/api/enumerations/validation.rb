# frozen_string_literal: true

module Yext
  module Api
    module Enumerations
      # An enumeration class to contain the allowable values for the validation option on
      # API calls.
      class Validation
        include Yext::Api::Concerns::EnumAll

        STRICT  = "strict"
        LENIENT = "lenient"
      end
    end
  end
end
