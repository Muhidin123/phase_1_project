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
    
    def self.welcome
        #font = TTY::Font.new(:starwars)
        #puts font.write("Welcome to this APP", letter_spacing: 1)
        #sleep(5)
        #system 'clear'
        User.setup_user
        sleep(3)
        system 'clear'
        menu
        sleep(2)
    end
    
    
    def self.user_input
        case $user
        when "All cities"
            all_cities = City.display_all_city_names
            binding.pry
        when "Search by city name"
            @city = City.find_by_name
            menu_user_after_picking_city
            #binding.pry
        when "Search by city climate"
            #binding.pry
            @city = City.find_by_climate
        when "Check all the cities you have"
            City.display_cities_of_user
            UserTrip.display_user_cities_as_menu
        when "EXIT"
             puts "We are so sorry to see you go :( until next time".red.italic
             exit
        end
    end
    
    def self.menu
        options = ["All cities", "Search by city name", "Search by city climate", "Check all the cities you have", "EXIT"]
        $user = prompt.select("Choose,KEEP IN MIND, IF YOU SELECT ALL CITIES LIST IS LONG", options)
        user_input
    end


    def self.menu_user_after_picking_city
        main_menu = ["Back to main menu", "Save this city to trip history", "EXIT"]
        @answer = prompt.select("What would you like to do next", main_menu)
        case @answer
        when "Back to main menu"
            menu
        when "Save this city to trip history"
            UserTrip.new_trip
        when "EXIT"
            puts "We are so sorry to see you go :( until next time".red.italic
            exit
        end
        menu
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
end