require 'logger'
require 'rest_client'
require 'json'

require_relative 'contentful_client/client'

if ENV['LOG_REQUESTS']
  RestClient.log = Logger.new(STDOUT)
end

