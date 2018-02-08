# frozen_string_literal: true

require "rails_helper"

RSpec.describe Yext::Api::Utils::Params do
  let(:base_hash) do
    { level_1:         { level_2:        { level_3:      "some value",
                                           level_3_also: { level_4: { epoch_value: "1517318433000" } } },
                         level_2_also:   { level_3: { level_4: { timestamp_value: "2018-01-26T18:38:29" } } },
                         level_2_values: { epoch_value: "1517318443000", timestamp_value: "2018-01-26T18:38:39" } },
      level_1_values:  { epoch_value: "1517318453000", timestamp_value: "2018-01-26T18:38:49" },
      epoch_value:     "1517318463000",
      timestamp_value: "2018-01-26T18:38:59" }
  end
  let(:params) { Yext::Api::Utils::Params.new(base_hash) }

  describe "convert_epoch" do
    it "does nothing if the parameter cannot be found" do
      expect { params.convert_epoch(:level_1, :level_2, :level_3_also, :fake_value) }.not_to raise_error

      expect(base_hash[:epoch_value]).to be_a(String)
      expect(base_hash[:level_1_values][:epoch_value]).to be_a(String)
      expect(base_hash[:level_1][:level_2_values][:epoch_value]).to be_a(String)
      expect(base_hash[:level_1][:level_2][:level_3_also][:level_4][:epoch_value]).to be_a(String)
    end

    it "does nothing if the parameter is nil" do
      base_hash[:level_1][:level_2_values][:epoch_value] = nil

      expect { params.convert_epoch(:level_1, :level_2_values, :epoch_value) }.not_to raise_error

      expect(base_hash[:epoch_value]).to be_a(String)
      expect(base_hash[:level_1_values][:epoch_value]).to be_a(String)
      expect(base_hash[:level_1][:level_2_values][:epoch_value]).to be_nil
      expect(base_hash[:level_1][:level_2][:level_3_also][:level_4][:epoch_value]).to be_a(String)
    end

    it "does nothing if the parameter is empty string" do
      base_hash[:level_1][:level_2_values][:epoch_value] = ""

      expect { params.convert_epoch(:level_1, :level_2_values, :epoch_value) }.not_to raise_error

      expect(base_hash[:epoch_value]).to be_a(String)
      expect(base_hash[:level_1_values][:epoch_value]).to be_a(String)
      expect(base_hash[:level_1][:level_2_values][:epoch_value]).to be_a(String)
      expect(base_hash[:level_1][:level_2][:level_3_also][:level_4][:epoch_value]).to be_a(String)
    end

    it "converts epochs at root level" do
      params.convert_epoch(:epoch_value)

      expect(base_hash[:epoch_value]).to be_a(Time)
      expect(base_hash[:epoch_value]).to be_within(1.second).of("2018-01-30 13:21:03 UTC".to_time)
    end

    it "converts epochs at lower levels" do
      params.convert_epoch(:level_1, :level_2, :level_3_also, :level_4, :epoch_value)

      expect(base_hash[:epoch_value]).to be_a(String)
      expect(base_hash[:level_1][:level_2_values][:epoch_value]).to be_a(String)
      expect(base_hash[:level_1][:level_2][:level_3_also][:level_4][:epoch_value]).to be_a(Time)
      expect(base_hash[:level_1][:level_2][:level_3_also][:level_4][:epoch_value]).to be_within(1.second).of("2018-01-30 13:20:33 UTC".to_time)
    end

    it "converts epochs at middle levels" do
      params.convert_epoch(:level_1, :level_2_values, :epoch_value)

      expect(base_hash[:epoch_value]).to be_a(String)
      expect(base_hash[:level_1][:level_2_values][:epoch_value]).to be_a(Time)
      expect(base_hash[:level_1][:level_2][:level_3_also][:level_4][:epoch_value]).to be_a(String)
      expect(base_hash[:level_1][:level_2_values][:epoch_value]).to be_within(1.second).of("2018-01-30 13:20:43 UTC".to_time)
    end
  end

  describe "convert_time" do
    it "does nothing if the parameter cannot be found" do
      expect { params.convert_time(:level_1, :level_2_also, :level_3, :fake_value) }.not_to raise_error

      expect(base_hash[:timestamp_value]).to be_a(String)
      expect(base_hash[:level_1_values][:timestamp_value]).to be_a(String)
      expect(base_hash[:level_1][:level_2_values][:timestamp_value]).to be_a(String)
      expect(base_hash[:level_1][:level_2_also][:level_3][:level_4][:timestamp_value]).to be_a(String)
    end

    it "does nothing if the parameter is nil" do
      base_hash[:level_1][:level_2_values][:timestamp_value] = nil

      expect { params.convert_time(:level_1, :level_2_values, :timestamp_value) }.not_to raise_error

      expect(base_hash[:timestamp_value]).to be_a(String)
      expect(base_hash[:level_1_values][:timestamp_value]).to be_a(String)
      expect(base_hash[:level_1][:level_2_values][:timestamp_value]).to be_nil
      expect(base_hash[:level_1][:level_2_also][:level_3][:level_4][:timestamp_value]).to be_a(String)
    end

    it "does nothing if the parameter is empty string" do
      base_hash[:level_1][:level_2_values][:timestamp_value] = ""

      expect { params.convert_time(:level_1, :level_2_values, :timestamp_value) }.not_to raise_error

      expect(base_hash[:timestamp_value]).to be_a(String)
      expect(base_hash[:level_1_values][:timestamp_value]).to be_a(String)
      expect(base_hash[:level_1][:level_2_values][:timestamp_value]).to be_a(String)
      expect(base_hash[:level_1][:level_2_also][:level_3][:level_4][:timestamp_value]).to be_a(String)
    end

    it "converts epochs at root level" do
      params.convert_time(:timestamp_value)

      expect(base_hash[:timestamp_value]).to be_a(Time)
      expect(base_hash[:timestamp_value]).to be_within(1.second).of("2018-01-26 18:38:59 UTC".to_time)
    end

    it "converts epochs at lower levels" do
      params.convert_time(:level_1, :level_2_also, :level_3, :level_4, :timestamp_value)

      expect(base_hash[:timestamp_value]).to be_a(String)
      expect(base_hash[:level_1][:level_2_values][:timestamp_value]).to be_a(String)
      expect(base_hash[:level_1][:level_2_also][:level_3][:level_4][:timestamp_value]).to be_a(Time)
      expect(base_hash[:level_1][:level_2_also][:level_3][:level_4][:timestamp_value]).to be_within(1.second).of("2018-01-26 18:38:29 UTC".to_time)
    end

    it "converts epochs at middle levels" do
      params.convert_time(:level_1, :level_2_values, :timestamp_value)

      expect(base_hash[:timestamp_value]).to be_a(String)
      expect(base_hash[:level_1][:level_2_values][:timestamp_value]).to be_a(Time)
      expect(base_hash[:level_1][:level_2_also][:level_3][:level_4][:timestamp_value]).to be_a(String)
      expect(base_hash[:level_1][:level_2_values][:timestamp_value]).to be_within(1.second).of("2018-01-26 18:38:39 UTC".to_time)
    end
  end
end
