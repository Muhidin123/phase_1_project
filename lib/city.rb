require 'pp'
require 'tty-font'
require 'tty-prompt'

class City < ActiveRecord::Base
    
    has_many :user_trips
    has_many :users, through: :user_trips
    
    def prompt
        TTY::Prompt.new
    end
 
    def self.display_all_city_names
        city_names_for_menu = self.all.order(:name).map do |city|
            city.name
        end
        user_city_input = prompt.select("Select your city", city_names_for_menu)
        @displayed_city = City.find_by(name: user_city_input)
        pp @displayed_city
    end


    def self.find_by_name
        user_input_of_city_name= prompt.ask("Search by city name if it's in my database I'll give you info: ")
        @result = City.find_by(name: user_input_of_city_name)
        pp @result
    end



    def self.find_by_climate
        input = prompt.select("Enter average temperature you want:", %w(59F 60F 63F 65F 66F 68F 69F 72F 75F 77F))
        pp City.find_by(average_temp: input)
    end


    def self.display_cities_of_user
        all_user_cities = UserTrip.all.select {|trips| trips.user_id == User.current_user.id}.map {|cities| cities.city_id}
        all_found_cities = City.find(all_user_cities)
        pp all_found_cities.sort
        sleep(3)
        system "clear"
    end


end