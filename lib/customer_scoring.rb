require "customer_scoring/version"
require 'unirest'

module CustomerScoring
  class Customer
    def self.score
      api_array = Unirest.get("").body 
      return OpenStruct.new(api_array)
    end
  end
end


