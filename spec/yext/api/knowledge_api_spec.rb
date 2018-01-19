# frozen_string_literal: true

require "rails_helper"

RSpec.describe Yext::Api::KnowledgeApi do
  it_behaves_like("includes RateLimits")
end
