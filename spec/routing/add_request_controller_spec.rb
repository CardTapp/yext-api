# frozen_string_literal: true

require "rails_helper"

RSpec.describe Yext::Api::Agreements::AddRequestController, type: :routing do
  routes { Yext::Api::Engine.routes }

  it "routes to callback" do
    expect(post: "/agreements/add_request").to route_to(controller: "yext/api/agreements/add_request", action: "create")
  end
end
