require 'rest-client'
require 'json'
require 'pry'

class City

    def get_info
        puts "Give me a country nameeee: "
        user_input = gets.chomp.gsub(" ", "%20")
        url_all = "https://restcountries.eu/rest/v2/name/#{user_input}"
        try = RestClient.get(url_all) 
        @result_2 = JSON.parse(try)
        @result_2.select {|x| x["name"] == user_input}.map {|x| x["name"]}[0]
        binding.pry
    end
end


City.new.get_info