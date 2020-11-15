require 'pp'
require 'tty-font'
<<<<<<< HEAD
City.connection
# require_relative 'user.rb'
# require_relative 'cli_com.rb'
# require_relative 'user_trip.rb'
=======
>>>>>>> f13ed4ae0a827282048b1012632e484af0a0518b

class City < ActiveRecord::Base
    
    has_many :user_trips
    has_many :users, through: :user_trips
    
    def prompt
        TTY::Prompt.new
    end
 
    def self.display_all_city_names
        binding.pry
        city_names_for_menu = self.all.map do |city|
            city.name
        end
        user_city_input = prompt.select("Select your city", city_names_for_menu)
        @displayed_city = City.find_by(name: user_city_input)
        pp @displayed_city
    end

    main_menu = ["Back to main menu", "Save this city to trip history", "EXIT"]
        @answer = prompt.select("What would you like to do next", main_menu)
        case @answer
        when "Back to main menu"
            menu
        when "Save this city to trip history"
            UserTrip.new_trip

        ### NEED TO EXIT BACK TO VIEW OF CITIES 
        when "EXIT"
            puts "We are so sorry to see you go :( until next time".red.italic
            exit
        end
        menu

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
    end



    def self.find_by_climate
        input = prompt.select("Enter avg temp u want:", %w(60F 65F 75F 79F 84F))
        pp City.find_by(average_temp: input)
    end


    def self.display_cities_of_user
        all_user_cities = UserTrip.all.select {|trips| trips.user_id == User.current_user.id}.map {|cities| cities.city_id}
        pp City.find(all_user_cities)
        sleep(3)
    end


end