require "customer_scoring/version"
require 'unirest'
require 'vcr'
require 'webmock'
require 'net/http'

module CustomerScoring
  class Customer
    def self.score(income, zipcode, age)
      errors = []      

      if income != income.scan(/\d+/)[0]
        errors << "Invalid income: #{income}"
      end

      if zipcode != zipcode.scan(/^\d{5}/)[0]
          errors << "Invalid zip code: #{zipcode}"
      end

      if age == age.scan(/\d+/)[0]
        unless (0..130).include?(age.to_i)
          errors << "Invalid age: #{age}"
        end
      else 
        errors << "Invalid age: #{age}"
      end

      if errors.length > 0
        return errors
      else
        uri = URI.parse('http://yahoo.com/customer_scoring?'),
        params = {:income => "#{income}", :zipcode => "#{zipcode}", :age => "#{age}"}
        # uri = URI('http://yahoo.com/customer_scoring?income=#{URI.encode(income)}&zipcode=#{URI.encode(zipcode)}&age=#{URI.encode(age)}')
        api_response_hash = Net::HTTP.get(uri)

        # api_response_hash = Unirest.get("http://yahoo.com/customer_scoring?income=#{income}&zipcode=#{zipcode}&age=#{age}")
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
                "Something isn't right... please try again."
            end
          end
      end    
    end
  end
end