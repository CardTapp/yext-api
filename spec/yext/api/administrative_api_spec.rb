# frozen_string_literal: true

require "rails_helper"

RSpec.describe Yext::Api::AdministrativeApi do
  it_behaves_like("includes RateLimits")
end
