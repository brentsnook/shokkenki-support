# -*- encoding: utf-8 -*-
$LOAD_PATH.unshift File.expand_path('../lib', __FILE__)
require 'shokkenki/support/version'

Gem::Specification.new do |s|
  s.name = 'shokkenki-support'
  s.version = Shokkenki::Support::Version::STRING
  s.platform = Gem::Platform::RUBY
  s.license = 'GPL2'
  s.authors = ['Brent Snook']
  s.email = 'brent@fuglylogic.com'
  s.homepage = 'http://github.com/brentsnook/shokkenki-support'
  s.summary = "shokkenki-support-#{Shokkenki::Support::Version::STRING}"
  s.description = 'Shared support for Shokkenki consumers and providers.'

  s.files = `git ls-files -- lib/*`.split("\n") + Dir.glob('lib/shokkenki/term/ruby-string-random/**/*')
  s.test_files = s.files.grep(%r{^spec/})
  s.rdoc_options = ['--charset=UTF-8']
  s.require_path = 'lib'

  s.required_ruby_version = '>= 1.9'

  s.add_runtime_dependency 'json'
  s.add_runtime_dependency 'activesupport', '>= 3.0.0'
  s.add_runtime_dependency 'jsonpath'

  s.add_development_dependency 'rake', '~> 10.0.0'
  s.add_development_dependency 'rspec', '~> 2.14.0'
end