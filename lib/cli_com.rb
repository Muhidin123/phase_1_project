require "tty-prompt"
require 'pp'
require 'colorize'
require_relative 'city.rb'
require_relative 'user.rb'
require_relative 'user_trip.rb'

class CliCom

    def initialize
    end

    def prompt
        prompt = TTY::Prompt.new
    end
    
    def welcome
        font = TTY::Font.new(:starwars)
        puts font.write("Welcome to this APP", letter_spacing: 1)
        sleep(5)
        system 'clear'
        User.setup_user
        sleep(3)
        system 'clear'
        menu
        # system 'clear'
        # menu_user_after_picking_city
    end
    
    
    def user_input
        case $answer
        when "All cities"
            all_cities = City.display_all_city_names
            binding.pry
        when "Search by city name"
            City.find_by_name
        when "Search by city climate"
            City.find_by_climate
        when "EXIT"
            good_bye

        end
    end
    
    def menu
        main_menu = ["All cities", "Search by city name","Search by city climate", "EXIT"]
        $answer = prompt.select("Choose,KEEP IN MIND, IF YOU SELECT ALL CITIES LIST IS LONG", main_menu)
        $answer
        user_input
    end
    
    def good_bye
        puts "We are so sorry to see you go :( until next time".red.italic
        exit
    end

    def menu_user_after_picking_city
        main_menu = ["Back to main menu", "Save this city to search history","EXIT"]
        $answer = prompt.select("What would you like to do next", main_menu)
        case $answer
        when "Back to main menu"
            menu
        when "Save this city to search history"
            good_bye
        when "EXIT"
            good_bye
        end
    end

    def self.delete_city
        # user_city_names = UserTrip.all.select do |trip|
        #   trip.user_id == current_user.id
        #   trip.name
        # end

        this_user_id = User.all.map do |user| 
            user.user_name
            user.id
        end
        
        #display all cities
        #selected city 
        user_trip= UserTrip.all.select {|trip| trip.user_id == this_user_id}
        
        user_city_ids = user_trip.map do |trip|
            trip.city_id 

        end
        found_city_ids = City.find(user_city_ids)
        binding.pry
      end

        

          #This user's all trip
      #all the cities
      #select the city
      #save this user id


      #find the city
      #go through the joiner
      #match the user to that city 
      #save this city id
      #delete this city

           # def self.new_trip
      #   city_id = Clicom.user_input.all_cities.map do |city|
      #     city.id
      #   end
          
      #     User.all.map do |user| 
      #       if user == self
      #         urser_id = user.id
      #         UserTrip.create(user_id: user_id, city_id: city_id)
      #       end
      #     end


end

