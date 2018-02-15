# frozen_string_literal: true

module Yext
  module Api
    module Enumerations
      class ErrorCodes
        # Feedback error codes
        #
        # http://developer.yext.com/docs/error-messages/#feedback-errors
        module FeedbackErrors
          include Yext::Api::Concerns::EnumAll

          FEEDBACK_MISSING_AUTHOR      = 8000
          FEEDBACK_MISSING_SCORE       = 8001
          FEEDBACK_MISSING_MESAGE      = 8002
          FEEDBACK_INVALID_EMAIL       = 8003
          FEEDBACK_INVALID_SCORE_RANGE = 8006
          FEEDBACK_MISSING_FEATURE     = 8007
          FEEDBACK_INVALID_STATUS      = 8008
          FEEDBACK_INVITATION_MISSING  = 8009
        end
      end
    end
  end
end
