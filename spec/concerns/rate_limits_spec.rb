# frozen_string_literal: true

require "rails_helper"

RSpec.describe Yext::Api::Concerns::RateLimits do
  class UnknownBase
  end

  module RateLimitModuleOne
    extend Yext::Api::Concerns::RateLimits

    module SubModuleOne
      class RateClassOne < UnknownBase
      end
    end

    class RateClassOne < UnknownBase
    end

    class RateClassOne < UnknownBase
    end
  end

  module RateLimitModuleTwo
    extend Yext::Api::Concerns::RateLimits

    class RateClassTwo < UnknownBase
    end

    class RateClassTwo < UnknownBase
    end
  end

  it "has separate limits for each module" do
    RateLimitModuleOne.update_rates(remaining: 1_000, limit: 2_000, reset_at: 2.hours.ago)
    RateLimitModuleTwo.update_rates(remaining: 3_000, limit: 4_000, reset_at: 2.hours.from_now)

    expect(RateLimitModuleOne.rate_limit_remaining).to eq 1_000
    expect(RateLimitModuleTwo.rate_limit_remaining).to eq 3_000

    expect(RateLimitModuleOne.rate_limit_limit).to eq 2_000
    expect(RateLimitModuleTwo.rate_limit_limit).to eq 4_000

    expect(RateLimitModuleOne.rate_limit_reset_at).to be_within(1.second).of(2.hours.ago)
    expect(RateLimitModuleTwo.rate_limit_reset_at).to be_within(1.second).of(2.hours.from_now)
  end
end
