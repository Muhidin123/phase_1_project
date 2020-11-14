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
        city_names_for_menu = self.all.map do |city|
            city.name
        end
        user_city_input = prompt.select("Select your city", city_names_for_menu)
        pp City.find_by(name: user_city_input)
    end

    ### METHOD TO FIND NAME EVEN IF GIVEN FULL NAME ###

    # def self.find_by_name
    #     var = prompt.ask("Search by city name if it's in my database I'll give you info: ")
    #     pp result = City.where('name like?', "%#{var}%")
    # end

    ################################################################


    def self.find_by_name
        user_input_of_city_name= prompt.ask("Search by city name if it's in my database I'll give you info: ")
        @result = City.find_by(name: user_input_of_city_name)
        pp @result
        
        # CliCom.menu_user_after_picking_city
    end



    def self.find_by_climate
        input = prompt.select("Enter avg temp u want:", %w(60F 65F))
        pp City.find_by(average_temp: input)
    end


    ################ TRY IMPLEMENTING MENU FOR USER TO PICK WHAT CITY TO DELETE###############

    def self.display_cities_of_user
        all_user_cities = UserTrip.all.select {|trips| trips.user_id == User.current_user.id}.map {|cities| cities.city_id}
        pp City.find(all_user_cities)
        sleep(3)
    end


end