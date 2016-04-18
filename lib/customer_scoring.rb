require "customer_scoring/version"
require 'vcr'
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
        # response = Net::HTTP.get_response(URI("https://www.yahoo.com/customer_scoring?income=#{"income"}&zipcode=#{"zipcode"}&age=#{"age"}"))
        response = Net::HTTP.get_response(URI("https://api.myjson.com/bins/4jbfc"))
        http_response_code = response.code.to_i
          if http_response_code == 200
            response_body = response.body
            temp_score = []
            score_hash = {}

            temp_score << response_body.scan(/\d(.....)\d/)[0][0]
            score_hash[:propensity] = temp_score[0]
            
            temp_score << response_body.scan(/\b[A-Z]/)
            score_hash[:ranking] = temp_score[1][0]

            return OpenStruct.new(score_hash)
          else
            if http_response_code.between?(400, 499)
                "#{http_response} error - Please verify your paramaters"
            elsif http_response_code.between?(500, 599)
                "#{http_response} error - Please try again.  If error continues contact administrator."
            else
                "Something isn't right... please try again."
            end
          end
      end    
    end
  end
end