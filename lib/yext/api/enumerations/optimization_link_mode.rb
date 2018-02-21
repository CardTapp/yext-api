# frozen_string_literal: true

module Yext
  module Api
    module Enumerations
      # The possible modes to search for when looking up Optimization Links
      class OptimizationLinkMode
        include Yext::Api::Concerns::EnumAll

        PENDING_ONLY = "PENDING_ONLY"
        ALL_TASKS    = "ALL_TASKS"
        RESET        = "RESET"
      end
    end
  end
end
