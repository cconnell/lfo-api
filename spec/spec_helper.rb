$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'customer_scoring'
require 'vcr'

VCR.configure do |c|
  c.cassette_library_dir = 'spec/cassettes'
  c.hook_into :fakeweb
  c.configure_rspec_metadata!
end

