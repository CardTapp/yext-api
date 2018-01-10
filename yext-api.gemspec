
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "yext/api/version"

Gem::Specification.new do |spec|
  spec.name          = "yext-api"
  spec.version       = Yext::Api::VERSION
  spec.authors       = ["RealNobody"]
  spec.email         = ["RealNobody1@cox.net"]

  spec.summary       = %q{An interface gem to the Yext API.}
  spec.description   = %q{A straightforward simple interface with the Yext API v2.}
  spec.homepage      = "TODO: Put your gem's website or public repo URL here."
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end



# # coding: utf-8
# lib = File.expand_path('../lib', __FILE__)
# $LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
#
# # Maintain your gem's version:
# require "cornucopia/version"
#
# # Describe your gem and declare its dependencies:
# Gem::Specification.new do |spec|
#   spec.name        = "cornucopia"
#   spec.version     = Cornucopia::VERSION
#   spec.authors = ["RealNobody"]
#   spec.email   = ["RealNobody1@cox.net"]
#   spec.summary     = "A collection of tools to simplify testing tasks."
#   spec.description = "A collection of tools I created to simplify and make it easier to see what is happening."
#   spec.homepage    = "https://github.com/RealNobody/cornucopia"
#   spec.license = "MIT"
#
#   # spec.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
#   spec.files = `git ls-files`.split($/)
#   spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
#   spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
#   spec.require_paths = ["lib"]
#
#   spec.add_dependency "activesupport", "< 5.0"
#
#   spec.add_development_dependency "rails"
#   # spec.add_development_dependency "mysql2"
#   spec.add_development_dependency "bundler"
#   spec.add_development_dependency "rake"
#   spec.add_development_dependency "rspec-rails"
#   spec.add_development_dependency "capybara"
#   spec.add_development_dependency "cucumber"
#   spec.add_development_dependency "cucumber-rails"
#   spec.add_development_dependency "faker"
#   spec.add_development_dependency "site_prism"
#   spec.add_development_dependency "selenium-webdriver"
#   spec.add_development_dependency "simplecov"
#   spec.add_development_dependency "launchy"
#   spec.add_development_dependency "rack"
# end
