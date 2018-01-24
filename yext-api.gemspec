# frozen_string_literal: true

# rubocop:disable BlockLength

lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "yext/api/version"

Gem::Specification.new do |spec|
  spec.name    = "yext-api"
  spec.version = Yext::Api::VERSION
  spec.authors = ["CardTapp"]
  spec.email   = ["dustin@cardtapp.com"]

  spec.summary     = "An interface gem to the Yext API."
  spec.description = "A straightforward simple interface with the Yext API v2."
  spec.homepage    = "https://github.com/CardTapp/yext-api"
  spec.license     = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  raise "RubyGems 2.0 or newer is required to protect against public gem pushes." unless spec.respond_to?(:metadata)

  spec.metadata["allowed_push_host"] = "https://rubygems.org"

  spec.files = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end

  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "rails", "~> 5.1.2"
  spec.add_dependency "spyke", "~> 5"

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "cornucopia"
  # spec.add_development_dependency "dotenv", "~> 2.0"
  # spec.add_development_dependency "dotenv-rails"
  spec.add_development_dependency "hashie"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "rspec-rails"
  spec.add_development_dependency "simplecov"
  spec.add_development_dependency "simplecov-rcov"
  spec.add_development_dependency "vcr"
  spec.add_development_dependency "webmock"
end

# rubocop:enable BlockLength
