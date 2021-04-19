# Banktools::Global

Validate and normalize international bank account numbers like IBAN and BIC.

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

### IBAN

```ruby
account = BankTools::Global::IBAN.new(" GB82 WEST 1234 5698 765432 ")
account.valid?  # => true
account.errors  # => []
account.normalize  # => "GB82 WEST 1234 5698 7654 32"

account = BankTools::Global::IBAN.new("GB82")
account.valid?  # => false
account.errors  # => [:too_short]

# Error codes

# TODO
```

### BIC

```ruby
account = BankTools::Global::BIC.new("ESS ESESS")
account.valid?  # => true
account.errors  # => []
account.normalize  # => "ESSESESS"

account = BankTools::Global::BIC.new("ESSEXXSS")
account.valid?  # => false
account.errors  # => [:unknown_country]

#  Error codes

Banktools::Global::Errors::BAD_FORMAT       # => :bad_format
Banktools::Global::Errors::UNKNOWN_COUNTRY  # => :unknown_country

```


## Also see

* [Our other banktools](https://github.com/barsoom?q=banktools)

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/barsoom/banktools-global.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
