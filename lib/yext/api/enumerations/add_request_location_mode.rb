# frozen_string_literal: true

module Yext
  module Api
    module Enumerations
      # The type of the location in an AddRequest
      class AddRequestLocationMode
        include Yext::Api::Concerns::EnumAll

        EXISTING = "EXISTING"
        NEW      = "NEW"
      end
    end
  end
end
