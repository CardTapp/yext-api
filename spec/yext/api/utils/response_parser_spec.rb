# frozen_string_literal: true

require "rails_helper"

RSpec.describe Yext::Api::Utils::Middleware::ResponseParser do
  let(:response_parser) { Yext::Api::Utils::Middleware::ResponseParser.new }
  let(:empty_body) { { meta: { errors: [] }, response: {} } }
  let(:object_data) { { id: "an id", name: "some name", sku: "fake sku" } }
  let(:data_array) { [object_data.dup, object_data.dup, object_data.dup, object_data.dup] }

  before(:each) do
    fake_app = instance_double(Faraday::Adapter::NetHttp, call: nil)

    response_parser.instance_variable_set(:@app, fake_app)
    response_parser.instance_variable_set(:@parse_env, {})
  end

  describe "parse" do
    it "takes an empty hash" do
      expect { response_parser.parse({}.to_json) }.not_to raise_error
    end

    describe "data" do
      it "returns a singleton object" do
        empty_body[:response] = object_data.dup

        response = response_parser.parse(empty_body.to_json)

        expect(response[:data]).to eq object_data
      end

      it "returns an array of objects" do
        empty_body[:response] = { objects: data_array.map(&:dup) }

        response = response_parser.parse(empty_body.to_json)

        expect(response[:data]).to eq data_array
      end

      it "returns an array of objects with a count" do
        empty_body[:response] = { count: data_array.count, objects: data_array.map(&:dup) }

        response = response_parser.parse(empty_body.to_json)

        expect(response[:data]).to eq data_array
      end
    end

    it "returns metadata" do
      empty_body[:meta][:uuid] = "some uuid"

      response = response_parser.parse(empty_body.to_json)

      expect(response[:metadata][:uuid]).to eq "some uuid"
    end

    it "saves metadata" do
      allow(Yext::Api::Utils::ApiFinder).to receive(:new).
          and_return instance_double(Yext::Api::Utils::ApiFinder, find_api: Yext::Api::KnowledgeApi)

      empty_body[:meta][:uuid] = "some uuid"

      response_parser.parse(empty_body.to_json)

      expect(Yext::Api::KnowledgeApi.last_meta[:uuid]).to eq "some uuid"
    end

    it "does not return errors" do
      empty_body[:meta][:errors] = "some error"

      response = response_parser.parse(empty_body.to_json)

      expect(response[:errors]).to be_blank
    end
  end
end
