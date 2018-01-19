# frozen_string_literal: true

RSpec.shared_examples("sets rate limits") do |test_call|
  all_modules = [Yext::Api::LiveApi, Yext::Api::KnowledgeApi, Yext::Api::AdministrativeApi]

  before(:each) do
    all_modules.each do |rate_module|
      rate_module.update_rates(remaining: 0, limit: 0, reset_at: nil)
    end
  end

  it "sets the rate limits" do
    test_call.call

    expect(described_class.parents[-4].rate_limit_limit).to be > 0
    expect(described_class.parents[-4].rate_limit_remaining).to be > 0
    expect(described_class.parents[-4].rate_limit_reset_at).to be

    (all_modules - [described_class.parents[-4]]).each do |other_module|
      expect(other_module.rate_limit_limit).to eq 0
      expect(other_module.rate_limit_remaining).to eq 0
      expect(other_module.rate_limit_reset_at).not_to be
    end
  end
end
