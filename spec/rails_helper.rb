# frozen_string_literal: true

# This file is copied to spec/ when you run "rails generate rspec:install"
ENV["RAILS_ENV"] ||= "test"

require "simplecov"
require "simplecov-rcov"

SimpleCov.formatters = [SimpleCov::Formatter::HTMLFormatter,
                        SimpleCov::Formatter::RcovFormatter]
SimpleCov.start "rails" do
  add_filter ".bundle"
  add_filter "version"
end

# require "dotenv"
# Dotenv.load

require File.expand_path("../dummy/config/environment", __FILE__)
# Prevent database truncation if the environment is production
abort("The Rails environment is running in production mode!") if Rails.env.production?
require "spec_helper"
require "rspec/rails"
require "hashie"
require "vcr"
require "webmock/rspec"

# require "fakeredis/rspec"
# require "factory_girl"

Dir[Yext::Api::Engine.root.join("spec/shared_examples/**/*.rb")].sort.each { |f| require f }
Dir[Yext::Api::Engine.root.join("spec/support/**/*.rb")].sort.each { |f| require f }

require "cornucopia"
require "cornucopia/rspec_hooks"

# Add additional requires below this line. Rails is not loaded until this point!

# Requires supporting ruby files with custom matchers and macros, etc, in
# spec/support/ and its subdirectories. Files matching `spec/**/*_spec.rb` are
# run as spec files by default. This means that files in spec/support that end
# in _spec.rb will both be required and run as specs, causing the specs to be
# run twice. It is recommended that you do not name files matching this glob to
# end with _spec.rb. You can configure this pattern with the --pattern
# option on the command line or in ~/.rspec, .rspec or `.rspec-local`.
#
# The following line is provided for convenience purposes. It has the downside
# of increasing the boot-up time by auto-requiring all files in the support
# directory. Alternatively, in the individual `*_spec.rb` files, manually
# require only the support files necessary.
#
# Dir[Yext::Api::Engine.root.join("spec/support/**/*.rb")].each { |f| require f }
# # $LOAD_PATH.unshift Yext::Api::Engine.root.join("spec/support")

# Checks for pending migration and applies them before tests are run.
# If you are not using ActiveRecord, you can remove this line.
# ActiveRecord::Migration.maintain_test_schema!

# require "database_cleaner"
# require "webmock/rspec"
# require "timecop"

# WebMock.disable_net_connect!

RSpec.configure do |config|
  # Remove this line if you"re not using ActiveRecord or ActiveRecord fixtures
  config.fixture_path = "#{Yext::Api::Engine.root}/spec/fixtures"

  # If you"re not using ActiveRecord, or you"d prefer not to run each of your
  # examples within a transaction, remove the following line or assign false
  # instead of true.
  config.use_transactional_fixtures = true

  # RSpec Rails can automatically mix in different behaviours to your tests
  # based on their file location, for example enabling you to call `get` and
  # `post` in specs under `spec/controllers`.
  #
  # You can disable this behaviour by removing the line below, and instead
  # explicitly tag your specs with their type, e.g.:
  #
  #     RSpec.describe UsersController, :type => :controller do
  #       # ...
  #     end
  #
  # The different available types are documented in the features, such as in
  # https://relishapp.com/rspec/rspec-rails/docs
  config.infer_spec_type_from_file_location!

  # Filter lines from Rails gems in backtraces.
  config.filter_rails_from_backtrace!
  # arbitrary gems may also be filtered via:

  # config.include FactoryGirl::Syntax::Methods
  # config.before(:suite) do
  #   FactoryGirl.find_definitions
  # end
  #
  # # config.filter_gems_from_backtrace("gem name")
  # config.before(:suite) do
  #   DatabaseCleaner.strategy = :transaction
  #   DatabaseCleaner.clean_with(:truncation)
  # end
  #
  # config.around(:each) do |example|
  #   DatabaseCleaner.cleaning { example.run }
  # end
  #
  # # Add a teamcity formatter
  # require "rspec/teamcity"
  # config.add_formatter Spec::Runner::Formatter::TeamcityFormatter
end

# Cornucopia::Util::Configuration.context_seed = 1
# Cornucopia::Util::Configuration.seed         = 1
# Cornucopia::Util::Configuration.order_seed   = 1
