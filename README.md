[![Gem Version](https://badge.fury.io/rb/yext-api.svg)](https://badge.fury.io/rb/yext-api.svg)
[![CircleCI](https://circleci.com/gh/CardTapp/yext-api.svg?style=svg)](https://circleci.com/gh/CardTapp/yext-api)
[![codecov](https://codecov.io/gh/CardTapp/yext-api/branch/master/graph/badge.svg)](https://codecov.io/gh/CardTapp/yext-api)
[![Dependency Status](https://gemnasium.com/badges/github.com/CardTapp/yext-api.svg)](https://gemnasium.com/github.com/CardTapp/yext-api)
[![Maintainability](https://api.codeclimate.com/v1/badges/d80882f00aafa1ed5c7b/maintainability)](https://codeclimate.com/github/CardTapp/yext-api/maintainability)

# Yext::Api

DEPRECATED AND NO LONGER MAINTAINED

This gem provides a Rails interface with the Yext API.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'yext-api'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install yext-api

## Usage

This gem uses the [Spyke gem](https://github.com/balvig/spyke) to simplify the HTML calls and create
a familiar ActiveRecord type interface with Yext and the Yext objects.  Please refer to that gem for
details on making calls, passing paraemters etc. if the documentation here is not sufficient.

### Configuration

To use the Yext API, you need to specify certain options like the account ID, the application ID, etc.
These options can be set to global defaults or set on a per-call basis.

A configuration option is avalable through `Yext::Api.configuration`.  All configuration options can
be set through here.  To confugure multiple items you can use `Yext::Api.configure`:

```ruby
Yext::Api.configure do |configuration|
  configuration.account_id  = "your account_id"
  configuration.api_key     = "your application key"
  configuration.api_version = "20161012"
end
```

The global configurations can be initialized with ENV values.  The following configurations are available:

* `account_id` - `ENV["YEXT_ACCOUNT_ID"]`
  This is the Account ID that is used in the path to API endpoints that require an account ID.  This
  value will default to `"me"` if not specified.

  You can specify this on a per-call basis using `account("new account_id")`.  This option is only
  available for objects that require an account ID for all calls.

* `api_key` - `ENV["YEXT_API_KEY"]`
  This is the API_KEY from the Yext Application that you are using.

  You can specify this on a per-call basis using `application("new application key")`.

* `api_version` - `ENV["YEXT_API_VERSION"]`
  This is the version number of the `v2` API endpoint to be used.  This value be defaulted to the most
  recent version of the API that the gem is aware of or `"2016101"`

  You can specify this on a per-call basis using `version("new version")`.

* `yext_username` - `ENV["YEXT_USERNAME"]`
  This is the username to be associated with changes in Yext.  This option is available on all calls but
  will only be used for `PUT`, `PATCH`, `CREATE`, and `DELETE` calls.

  You can specify this on a per-call basis using `yext_username("your username")`.

* `yext_user_id` - `ENV["YEXT_USER_ID"]`
  This is the ID of the user to be associated with changes in Yext.  This option is available on all calls but
  will only be used for `PUT`, `PATCH`, `CREATE`, and `DELETE` calls.

  You can specify this on a per-call basis using `yext_user_id("your user_id")`.

* `validation_level` - `ENV["YEXT_VALIDATION_LEVEL"]`
  The validation level to be used on the call.  This value can only be `strict` or `lenient`.
  Yext will default this if not specified to "strict" if you do not specify a value.

  You can specify this on a per-call basis using:
  * `validate(true)` (for strict)
  * `validate(false)` (for lenient)
  * `validate(Yext::Api::Enumerations::Validation::LENIENT)`

* `sandbox` - `!Rails.env.production?`
  Wether or not to use the Sandbox API endpoint or the API endpoint.  This option cannot be set on a
  per-call basis.  This option is ignored for all objects under the `LiveApi` namespace.

### Events

Webhooks are implimented as ActiveSupport::Notifications.

You can hook into notifications in multiple ways:

```ruby
# with a class:
class AddRequestChanged
  def self.call(name, started, finished, unique_id, data)
    params_hash = { name: name, started: started, finished: finished, unique_id: unique_id, data: data }
    Rails.logger.error "add_request_changed called: #{params_hash}"
  end
end

ActiveSupport::Notifications.subscribe "add_request.knowledge_manager.yext", AddRequestChanged

# with a block:
ActiveSupport::Notifications.subscribe "add_request.knowledge_manager.yext" do |name, started, finished, unique_id, data|
end
```

The following notifications will be
instrumented with the indicated parameters:

* add_request.knowledge_manager.yext
    * **meta** - The meta information for the webhook
    * **add_request** - A Yext::Api::AdministrativeApi::AddRequest object of the changed AddRequest.

* listing.powerlistings.yext
    * **meta** - The meta information for the webhook
    * **listing** - A Yext::Api::KnowledgeApi::Powerlistings::Listing object of the changed Listing.

### General Usage

The API namespaces are setup to mimic the structure of the Yext API documentation to make it easier
to find or guess at an objects name.  Objects are defined based on the routes for those objects.

In general to see what an object will look like or what to pass in as arguments to some custom routes
that update or create objects, please refer to the Yext API documentation:

* http://developer.yext.com/docs/api-reference/
* http://developer.yext.com/docs/administrative-api/
* http://developer.yext.com/docs/live-api/
* http://developer.yext.com/docs/webhooks/

The config/api.yml file contains links to the documentation for every action.  In general, each
class should also include the same information to point you at/to the related documentation.

The following classes are planned based on that structure:

* AdministrativeApi::Account
* AdministrativeApi::AddRequest
* AdministrativeApi::Service
* KnowledgeApi::HealthCheck::Health
* KnowledgeApi::KnowledgeManager::Location
* KnowledgeApi::KnowledgeManager::Folder
* KnowledgeApi::KnowledgeManager::Menu
* KnowledgeApi::KnowledgeManager::Bio
* KnowledgeApi::KnowledgeManager::Product
* KnowledgeApi::KnowledgeManager::Event
* KnowledgeApi::KnowledgeManager::Category
* KnowledgeApi::KnowledgeManager::GoogleField
* KnowledgeApi::KnowledgeManager::CustomField
* KnowledgeApi::KnowledgeManager::LanguageProfile
* KnowledgeApi::KnowledgeManager::Asset
* KnowledgeApi::PowerListings::Publisher
* KnowledgeApi::PowerListings::Listing
* KnowledgeApi::PowerListings::PublisherSuggestion
* KnowledgeApi::Analytics::MaxDate
* KnowledgeApi::Analytics::Report
* KnowledgeApi::Analytics::Activity
* KnowledgeApi::Reviews::Review
* KnowledgeApi::Reviews::Comment
* KnowledgeApi::Reviews::ReviewInvitation
* KnowledgeApi::Reviews::ReviewGenerationSetting
* KnowledgeApi::Social::Post
* KnowledgeApi::Social::Comment
* KnowledgeApi::Social::LinkedAccount
* KnowledgeApi::AccountSettings::Role
* KnowledgeApi::AccountSettings::User
* KnowledgeApi::AccountSettings::Account
* KnowledgeApi::OptimizationTasks::OptimizationTask
* KnowledgeApi::OptimizationTasks::OptimizationLink
* LiveApi::Menu
* LiveApi::Bio
* LiveApi::Product
* LiveApi::Event
* LiveApi::LanguageProfile
* LiveApi::LanguageProfileSchema
* LiveApi::Location
* LiveApi::LocationSchema

#### Fetching a list of objects

Use `all`:

```ruby
Yext::Api::AdministrativeApi::Account.all.each do |account|
  sku_match?(account.sku)
end
```

#### Fetching a single object

Use `find` if you want to raise an exception if it cannot be found

```ruby
account = Yext::Api::AdministrativeApi::Account.find("my-id")
```

Use `where(id: id).get` if you do not want an exception to be raised:

```ruby
account = Yext::Api::AdministrativeApi::Account.where(id: "my-id").get
```

#### Overriding configuration options

```ruby
other_account_services = Yext::Api::AdministrativeApi::Service.account("6664444").application("777821019292928").to_a
```

#### Using custom actions

```ruby
available_services = Yext::Api::AdministrativeApi::Service.available.to_a
```

#### API Rate Limits

Yext returns rate limit information for each call.  This information is different for each category of
API call, so it is stored in the base Namespace for each call.

NOTE:  Accounts are listed in the API documentation in both the `AdministrativeApi` and the `KnowledgeApi`
namespaces.  The `index` and `get` options are available in both locations, but the rate limites are
ONLY recorded in `KnowledgeApi`.

```ruby
Yext::Api::AdministrativeApi::Service.all.to_a

# Now the following values are set based on the response.
Yext::Api::AdministrativeApi.rate_limit_limit
Yext::Api::AdministrativeApi.rate_limit_remaining
Yext::Api::AdministrativeApi.rate_limit_reset_at
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the
tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version,
update the version number in `version.rb`, and then run `bundle exec rake release`, which will create
a git tag for the version, push git commits and tags, and push the `.gem` file to
[rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/yext-api. This
project is intended to be a safe, welcoming space for collaboration, and contributors are expected to
adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Yext::Api project’s codebases, issue trackers, chat rooms and mailing lists
is expected to follow the [code of conduct](https://github.com/[USERNAME]/yext-api/blob/master/CODE_OF_CONDUCT.md).
