# ContentfulClient

This gem is work in progress

It allows to communicate with the Contentful API.

## Installation

Checkout the repository.

## Usage

For now, it allows defining a client and calling some endpoints on it:

```ruby
options = {
  access_token: '123',
  space_id: '456'
}
client = Contentful::Client.new(options)
client.entries
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
