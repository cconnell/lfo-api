# CustomerScoring

This gem is a wrapper for the Customer Scoring Advice API and allows easy access to API through Ruby.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'customer_scoring'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install customer_scoring

## Usage

To access the API, initialize a customer using their income, zip code, and age as arguments.  Arguments are passed as strings.
```ruby
customer = CustomerScoring::Customer.score("income", "zipcode", "age")
customer.propensity
customer.ranking

```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/customer_scoring.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

