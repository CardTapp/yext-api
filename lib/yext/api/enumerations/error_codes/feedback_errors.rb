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

          FEEDBACK_MISSING_AUTHOR      = { code:      8000,
                                           http_code: 400,
                                           message:   "Invalid/missing parameters: No author specified" }.freeze
          FEEDBACK_MISSING_SCORE       = { code:      8001,
                                           http_code: 400,
                                           message:   "Invalid/missing parameters: No score specified" }.freeze
          FEEDBACK_MISSING_MESAGE      = { code:      8002,
                                           http_code: 400,
                                           message:   "Invalid/missing parameters: No message specified" }.freeze
          FEEDBACK_INVALID_EMAIL       = { code:      8003,
                                           http_code: 400,
                                           message:   "Invalid/missing parameters: Invalid email provided" }.freeze
          FEEDBACK_INVALID_SCORE_RANGE = { code:      8006,
                                           http_code: 400,
                                           message:   "Invalid/missing parameters: Score must be between 1 and 5 inclusive" }.freeze
          FEEDBACK_MISSING_FEATURE     = { code:      8007,
                                           http_code: 403,
                                           message:   "Location id {0}.freeze does not have the consumer feedback feature" }.freeze
          FEEDBACK_INVALID_STATUS      = { code:      8008,
                                           http_code: 400,
                                           message:   "Invalid parameters: Testimonial status {0}.freeze is not allowed. Valid " \
                                                          "values are FEATURED, NOT_FEATURED, and PENDING_ACTION" }.freeze
          FEEDBACK_INVITATION_MISSING  = { code:      8009,
                                           http_code: 400,
                                           message:   "Invalid/missing parameters: 'invites' object is required as a JSON Array." }.freeze
        end
      end
    end
  end
end
