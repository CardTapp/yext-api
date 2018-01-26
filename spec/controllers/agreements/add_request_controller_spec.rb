# frozen_string_literal: true

require "rails_helper"

RSpec.describe Yext::Api::Agreements::AddRequestController, type: :controller do
  let(:params) { JSON.parse(body, symbolize_names: true) }
  let(:body) { File.read(Yext::Api::Engine.root.join("spec/fixtures/webhooks/agreements/add_request/completed_callback.json")) }

  routes { Yext::Api::Engine.routes }

  class AddRequestControllerTestProcessor
    attr_reader :meta,
                :object,
                :localization

    def initialize(meta, object, localizations)
      @meta          = meta
      @object        = object
      @localizations = localizations
    end

    def add_request_changed
      puts "add_request_changed called"
    end
  end

  around(:each) do |example_proxy|
    configuration = Yext::Api.configuration

    orig_callback_processor = configuration.get_callback_processor(:add_request_changed)

    begin
      configuration.set_callback_processor(:add_request_changed, AddRequestControllerTestProcessor)

      example_proxy.run
    ensure
      configuration.set_callback_processor(:add_request_changed, orig_callback_processor)
    end
  end

  describe "create" do
    it "returns success" do
      post :create, params: params

      expect(response).to be_success
      expect(response.body).to be_blank
    end

    it "converts times" do
      processor = nil
      allow(AddRequestControllerTestProcessor).to receive(:new).and_wrap_original do |orig_function, *args|
        processor = orig_function.call(*args)
      end

      post :create, params: params

      expect(processor.meta[:timestamp]).to be_a(Time)
      expect(processor.object.dateSubmitted).to be_a(Time)
      expect(processor.object.dateCompleted).to be_a(Time)
    end

    it "calls the add_request_changed function" do
      processor = AddRequestControllerTestProcessor.new(params[:meta],
                                                        Yext::Api::AdministrativeApi::AddRequest.new(params[:addRequest]),
                                                        nil)
      allow(AddRequestControllerTestProcessor).to receive(:new).and_return processor

      expect(processor).to receive(:add_request_changed)

      post :create, params: params
    end

    it "does not call add_request_changed if nothing is configured" do
      Yext::Api.configuration.set_callback_processor(:add_request_changed, nil)

      expect(AddRequestControllerTestProcessor).not_to receive(:new)

      post :create, params: params
    end
  end
end
