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

    def entry(id, params = {})
      get([entries_path, id].join('/'), params)
    end

    def content_types(params = {})
      get(content_types_path, params)
    end

    def content_type(id, params = {})
      get([content_types_path, id].join('/'), params)
    end

    def asset(id)
      get([assets_path, id].join('/'))
    end

    def protocol
      options[:protocol] || 'https'
    end

    private

    attr_reader :options

    def get(path, params = {})
      uri = [host, path].join
      RestClient.get(uri, params: { access_token: access_token }.merge(params))
    end

    def entries_path
      [spaces_path, 'entries'].join('/')
    end

    def content_types_path
      [spaces_path, 'content_types'].join('/')
    end

    def assets_path
      [spaces_path, 'assets'].join('/')
    end

    def spaces_path
      "/spaces/#{space_id}"
    end

    def space_id
      options[:space_id] || raise(SpaceIdError, 'provide a valid space id')
    end

    def access_token
      options[:access_token] || raise(AccessTokenError, 'provide a valid access token')
    end

    def host
      "#{protocol}://cdn.contentful.com"
    end

  end

end


