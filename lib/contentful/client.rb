module Contentful

  class Client

    class AccessTokenError < StandardError; end
    class SpaceIdError < StandardError; end

    def initialize(options = {})
      @options = options
    end

    def entries(params = {})
      get(entries_path, params)
    end

    def entry(id)
      get([entries_path, id].join('/'))
    end

    private

    attr_reader :options

    def entries_path
      "/spaces/#{space_id}/entries"
    end

    def get(path, params = {})
      uri = [host, path].join
      RestClient.get(uri, params: { access_token: access_token }.merge(params))
    end

    def space_id
      options[:space_id] || raise(SpaceIdError, 'provide a valid space id')
    end

    def access_token
      options[:access_token] || raise(AccessTokenError, 'provide a valid access token')
    end

    def protocol
      @protocol || 'https'
    end

    def host
      "#{protocol}://cdn.contentful.com"
    end

  end

end


