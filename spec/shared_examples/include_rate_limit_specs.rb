# frozen_string_literal: true

RSpec.shared_examples("includes RateLimits") do
  let(:limit) { rand(1_000..2_000) }
  let(:remaining) { rand(1_000..2_000) }
  let(:reset_at) { rand(1_000..2_000).seconds.from_now }

  before(:each) do
    described_class.send(:update_rates, remaining: remaining, limit: limit, reset_at: reset_at)
  end

  it "includes RateLimits" do
    expect((
           class << described_class
             self
           end).included_modules).to be_include Yext::Api::Concerns::RateLimits
  end

  it "return rate_limit_limit" do
    expect(described_class.rate_limit_limit).to eq limit
  end

  it "return rate_limit_remaining" do
    expect(described_class.rate_limit_remaining).to eq remaining
  end

  it "return rate_limit_reset_at" do
    expect(described_class.rate_limit_reset_at).to be_within(1.second).of(reset_at)
  end
end
