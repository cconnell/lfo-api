# CustomerScoring

This gem is a wrapper for the Customer Scoring Advice API and allows easy access to the API with simple Ruby.

## Dependencies
The gem requires Ruby v. 2.2.3 and the following gems:
```ruby
"bundler", "~> 1.11"
"rake", "~> 10.0"
"rspec", "~> 3.0"
"vcr", "~> 3.0.1"
"webmock", "~> 1.24.3"
```

## Installation

Download or clone the repo.  Using terminal, navigate to the root directory and execute:

```ruby
bundle exec rake install
```

## Usage

Open irb and require the gem:
```ruby
require 'customer_scoring'
```
To access the API, initialize a customer using their income, zip code, and age as arguments.  Arguments are passed as strings.
```ruby
customer = CustomerScoring::Customer.score("income", "zipcode", "age")
```
Example:
```ruby
customer = CustomerScoring::Customer.score("50000", "60201", "35")
```


To access propensity and ranking for the customer:
```ruby
customer.propensity
=>0.26532
customer.ranking
=>"C"
```


## Testing

RSpec tests are included.  These tests will test the for both number of arguments and the server response. To run the tests, navigate to the root directory in terminal and execute:
```ruby
rspec
```



## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/cconnell/customer_scoring.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).