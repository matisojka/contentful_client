require_relative '../lib/contentful_client'

require 'rspec/autorun'
require 'webmock/rspec'
require 'pry'

def fixtures
  @fixtures ||= {}
end

def get_fixture(name)
  File.read(fixtures[name])
end

fixture_path = "#{File.dirname(__FILE__)}/fixtures/*.json"
Dir[fixture_path].each do |filepath|
  basename = File.basename(filepath, '.json')
  fixtures[basename] = filepath
end

