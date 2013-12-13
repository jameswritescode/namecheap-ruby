# Namecheap

A gem to use the Namecheap API easily.

There are many like it, but this one is mine.

This is a work in progress, but totally useable. Feel free to contribute.

## Installation

Add this line to your application's Gemfile:

    gem 'namecheap-ruby'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install namecheap-ruby

## Usage

```ruby
Namecheap.configure user: 'something', api_key: 'something', ip: 'something'

Namecheap::Domain.get_list
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
