# frozen_string_literal: true

module Yext
  module Api
    # http://developer.yext.com/docs/administrative-api
    #
    # Yext Administrative API
    module AdministrativeApi
      extend Yext::Api::Concerns::RateLimits
    end
  end
end
