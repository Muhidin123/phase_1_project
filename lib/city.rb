require 'pp'
require 'tty-font'

# require_relative 'user.rb'
# require_relative 'cli_com.rb'
# require_relative 'user_trip.rb'

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
        input = prompt.select("Choose your city", test)
        pp City.find_by(name: input)
        #binding.pry
    end

    # def self.find_by_name
    #     var = prompt.ask("Search by city name if it's in my database I'll give you info: ")
    #     pp result = City.where('name like?', "%#{var}%")
    # end

    def self.find_by_name
        var = prompt.ask("Search by city name if it's in my database I'll give you info: ")
        pp result = City.find_by(name: var)
    end



    def self.find_by_climate
        input = prompt.select("Enter avg temp u want:", %w(60F 65F))
        pp City.find_by(average_temp: input)
    end


    ################ TRY IMPLEMENTING MENU FOR USER TO PICK WHAT CITY TO DELETE###############

    def self.display_cities_of_user
        var = UserTrip.all.select {|trips| trips.user_id == User.current_user.id}.map {|cities| cities.city_id}
        pp City.find(var)
        sleep(3)
        binding.pry
        var = UserTrip.find_and_delete
        #binding.pry
    end


end