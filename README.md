# Yext::Api

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

  You can specify this on a per-call basis using `with_account("new account_id")`.  This option is only
  available for objects that require an account ID for all calls.

* `api_key` - `ENV["YEXT_API_KEY"]`
  This is the API_KEY from the Yext Application that you are using.

  You can specify this on a per-call basis using `with_application("new application key")`.

* `api_version` - `ENV["YEXT_API_VERSION"]`
  This is the version number of the `v2` API endpoint to be used.  This value be defaulted to the most
  recent version of the API that the gem is aware of or `"2016101"`

  You can specify this on a per-call basis using `with_version("new version")`.

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

### General Usage

The API namespaces are setup to mimic the structure of the Yext API documentation to make it easier.
to find or guess at an objects name.  Objects are defined based on the routes for those objects.  The
following classes are planned based on that structure:

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

Use `find`

```ruby
account = Yext::Api::AdministrativeApi::Account.find("my-id")
```

#### Overriding configuration options

```ruby
other_account_services = Yext::Api::AdministrativeApi::Service.with_account("6664444").with_application("777821019292928").to_a
```

#### Using custom actions

```ruby
available_services = Yext::Api::AdministrativeApi::Service.available.to_a
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
