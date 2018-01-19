# frozen_string_literal: true

module Yext
  module Api
    # http://developer.yext.com/docs/api-reference
    #
    # Yext Knowledge API
    module LiveApi
      extend Yext::Api::Concerns::RateLimits
    end
  end
end
