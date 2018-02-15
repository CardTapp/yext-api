# frozen_string_literal: true

module Yext
  module Api
    module Enumerations
      class ErrorCodes
        # Optimizations error codes
        #
        # http://developer.yext.com/docs/error-messages/#optimizations-errors
        module OptimizationsErrors
          include Yext::Api::Concerns::EnumAll

          OPTIMIZATIONS_BAD_REQUEST = 1400
          NO_VALID_TASK_IDS         = 1401
        end
      end
    end
  end
end
