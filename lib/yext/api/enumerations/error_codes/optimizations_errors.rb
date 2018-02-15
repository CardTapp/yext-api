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

          OPTIMIZATIONS_BAD_REQUEST = { code:      1400,
                                        http_code: 400,
                                        message:   "Bad Request" }.freeze
          NO_VALID_TASK_IDS         = { code:      1401,
                                        http_code: 400,
                                        message:   "No valid task ids were provided" }.freeze
        end
      end
    end
  end
end
