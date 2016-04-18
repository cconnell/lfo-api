lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'customer_scoring/version'

Gem::Specification.new do |spec|
  spec.name          = "customer_scoring"
  spec.version       = CustomerScoring::VERSION
  spec.authors       = ["Chris Connell"]
  spec.email         = ["chris.g.connell@gmail.com"]

  spec.summary       = %q{This gem is a wrapper for the Customer Scoring Advice API}
  spec.description   = %q{This gem allows access to the Customer Scoring Advice API in Ruby.}
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.11"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "vcr", "~> 3.0.1"
  spec.add_development_dependency "webmock", "~> 1.24.3"

end
