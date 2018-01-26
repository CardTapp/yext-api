# frozen_string_literal: true

# Custom matcher for account paths that replaces the account_id with a static value.
class SortedParamsMatcher
  attr_reader :left_request,
              :right_request

  def initialize(left_request, right_request)
    @left_request  = left_request
    @right_request = right_request
  end

  def call
    left_uri  = strip_uri(left_request.uri)
    right_uri = strip_uri(right_request.uri)

    left_uri == right_uri
  end

  private

  def strip_uri(uri)
    uri = URI.parse(uri)

    reqbuild_query_string(uri)

    uri.to_s
  end

  def reqbuild_query_string(uri)
    params = Rack::Utils.parse_nested_query(uri.query).with_indifferent_access

    %i[v api_key].each do |key_name|
      params.delete(key_name)
    end

    params = params.sort.to_h.to_query
    params = nil if params.blank?

    uri.query = params
  end
end
