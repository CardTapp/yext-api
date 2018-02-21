# frozen_string_literal: true

require "rails_helper"

RSpec.describe Yext::Api::Agreements::AddRequestController, type: :controller do
  let(:params) { JSON.parse(body, symbolize_names: true) }
  let(:body) { File.read(Yext::Api::Engine.root.join("spec/fixtures/webhooks/agreements/add_request/completed_callback.json")) }

  routes { Yext::Api::Engine.routes }

  class AddRequestChanged
    def self.call(name, started, finished, unique_id, data)
      params_hash = { name: name, started: started, finished: finished, unique_id: unique_id, data: data }
      Rails.logger.error "add_request_changed called: #{params_hash}"
    end
  end

  describe "create" do
    before(:context) do
      ActiveSupport::Notifications.subscribe "add_request.changed.yext", AddRequestChanged
    end

    it "returns success" do
      post :create, params: params

      expect(response).to be_success
      expect(response.body).to be_blank
    end

    it "instruments a notification" do
      expect(Rails.logger).to receive(:error).with(/add_request_changed called: /)

      post :create, params: params
    end
  end
end
