require "customer_scoring/version"
require 'unirest'

module CustomerScoring
  class Customer
     def self.score(income, zipcode, age)
          api_response_hash = Unirest.get("http://not_real.com/customer_scoring?income=#{income}&zipcode=#{zipcode}&age=#{age}").body 
        http_response = api_response_hash.code
        if http_response == 200
          response_body = api_response_hash.body
          return OpenStruct.new(response_body)
        else
            if http_response.between?(400, 499)
              "#{http_response} error - Please verify your paramaters"
            elsif http_response.between?(500, 599)
              "#{http_response} error - Please try again.  If error continues contact administrator."
            else
              "Please try again."
            end
        end  
    end
  end
end