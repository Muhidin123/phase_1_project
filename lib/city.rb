require 'pp'
require 'tty-font'
class City < ActiveRecord::Base
    
    has_many :user_trips
    has_many :users, through: :user_trips
    
    def prompt
        TTY::Prompt.new
    end

    def self.display_all_city_names
        test = self.all.map do |city|
            city.name
            #binding.pry
        end
        input = prompt.select("Chose your city", test)
        pp City.find_by(name: input)
        #binding.pry
    end

    def self.find_by_name
        var = prompt.ask("Search by city name if it's in my database I'll give you info: ")
        pp result = City.where('name like?', "%#{var}%")
    end


    def self.find_by_climate
        input = prompt.select("Enter avg temp u want:", %w(78F 66F))
        pp City.find_by(average_temp: input)
    end



end