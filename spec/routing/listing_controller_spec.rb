# frozen_string_literal: true

require "rails_helper"

RSpec.describe Yext::Api::Powerlistings::ListingController, type: :routing do
  routes { Yext::Api::Engine.routes }

  it "routes to callback" do
    expect(post: "/powerlistings/listing").to route_to(controller: "yext/api/powerlistings/listing", action: "create")
  end
end
