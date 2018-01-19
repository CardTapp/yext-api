# frozen_string_literal: true

# Code in this file is copied from `require "rails/all"`

RAILS_ALL = %w[active_record/railtie
               action_controller/railtie
               action_view/railtie
               action_mailer/railtie
               active_job/railtie
               action_cable/engine
               rails/test_unit/railtie
               sprockets/railtie].freeze

# Yext is not using these elements of Rails yet.  Remove them.
RAILS_USED = RAILS_ALL - %w[active_record/railtie
                            action_view/railtie
                            action_mailer/railtie
                            active_job/railtie
                            action_cable/engine
                            rails/test_unit/railtie
                            sprockets/railtie].freeze

RAILS_USED.each do |railtie|
  begin
    require railtie
  rescue LoadError => e
    # :nocov:
    Rails.logger.error e
    # :nocov:
  end
end
