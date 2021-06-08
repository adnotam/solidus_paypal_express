# frozen_string_literal: true

require_relative 'lib/solidus_paypal_express/version'

Gem::Specification.new do |spec|
  spec.name = 'solidus_paypal_express'
  spec.version = SolidusPaypalExpress::VERSION
  spec.authors = ['Solidus Commerce', 'Antonio Facciolo']
  spec.email = 'afdev82@gmail.com'

  spec.summary = 'Adds PayPal Express as a Payment Method to Solidus Commerce'
  spec.description = 'Adds PayPal Express as a Payment Method to Solidus Commerce'
  spec.homepage = 'https://github.com/adnotam/solidus_paypal_express'
  spec.license = 'BSD-3'

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = 'https://github.com/adnotam/solidus_paypal_express'
  spec.metadata['changelog_uri'] = 'https://github.com/adnotam/solidus_paypal_express/releases'

  spec.required_ruby_version = Gem::Requirement.new('>= 2.5')

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  files = Dir.chdir(__dir__) { `git ls-files -z`.split("\x0") }

  spec.files = files.grep_v(%r{^(test|spec|features)/})
  spec.test_files = files.grep(%r{^(test|spec|features)/})
  spec.bindir = "exe"
  spec.executables = files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency 'solidus_core', ['>= 2.0.0', '< 4']
  spec.add_dependency 'solidus_support', '~> 0.5'
  spec.add_dependency 'paypal-sdk-merchant', '1.117.2'
  # spec.add_dependency 'sass-rails', '~> 5.0.8'

  spec.add_development_dependency 'solidus_dev_support', '~> 2.1'
end
