# frozen_string_literal: true

Rails.application.routes.draw do
  mount Yext::Api::Engine => "/yext-api"
end
