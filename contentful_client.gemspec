# coding: utf-8
$:.unshift File.expand_path('../lib', __FILE__)
require 'contentful_client/version'

Gem::Specification.new do |spec|
  spec.name          = 'contentful_client'
  spec.version       = Contentful::VERSION
  spec.authors       = ['Mateusz Sójka']
  spec.email         = ['yagooar@gmail.com']
  spec.description   = %q{contentful_client allows to use Ruby to communicate with the Contentful API in a simple and clean way.}

  spec.summary       = %q{A tiny Ruby wrapper around the Contentful API.}
  spec.homepage      = ''
  spec.license       = 'MIT'

  spec.files         = Dir['README.md', 'LICENSE.txt', 'lib/**/*', 'spec/**/*']
  spec.test_files    = spec.files.grep(%r{^(spec)/})
  spec.require_paths = ['lib']

  spec.add_runtime_dependency 'multi_json'
  spec.add_runtime_dependency 'rest-client'

  spec.add_development_dependency 'bundler', '~> 1.3'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'pry'

  # testing
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'guard-rspec'
  spec.add_development_dependency 'terminal-notifier-guard'
  spec.add_development_dependency 'webmock', '1.15'

end

