require 'logger'
require 'rest_client'
require 'json'

require_relative 'contentful/version'
require_relative 'contentful/client'

if ENV['LOG_REQUESTS']
  RestClient.log = Logger.new(STDOUT)
end

