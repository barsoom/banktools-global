# Banktools::Global

Validate and normalize international bank account numbers like IBAN. (At the time of writing, it's only IBAN, but we may add support for e.g. BIC/SWIFT later as needed.)

Based on [iban-tools](https://github.com/iulianu/iban-tools) which became unmaintained.

## Installation

Add this line to your application's Gemfile:

```ruby
gem "banktools-global"
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install banktools-global

## Usage

TODO: Write usage instructions here

## Also see

* [Our other banktools](https://github.com/barsoom?q=banktools)

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/barsoom/banktools-global.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
