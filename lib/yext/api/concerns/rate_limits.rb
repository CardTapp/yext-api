# frozen_string_literal: true

module Yext
  module Api
    module Concerns
      # This module adds attributes to a module for saving and setting the rate limits returned
      # from the Yext API.
      module RateLimits
        attr_reader :rate_limit_remaining,
                    :rate_limit_limit,
                    :rate_limit_reset_at,
                    :last_status,
                    :last_meta

        def last_status=(last_status)
          @last_status = last_status
        end

        def last_meta=(last_meta)
          @last_meta = last_meta
        end

        def update_rates(remaining: 1_000, limit: 1_000, reset_at: Time.now)
          @rate_limit_limit     = limit
          @rate_limit_remaining = remaining
          @rate_limit_reset_at  = reset_at
        end
      end
    end
  end
end
