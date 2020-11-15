require "tty-prompt"
require 'pp'
require 'colorize'
require_relative 'city.rb'
require_relative 'user.rb'
require_relative 'user_trip.rb'

class CliCom

    def prompt
        prompt = TTY::Prompt.new
    end
    
    def self.welcome
        font = TTY::Font.new(:starwars)
        puts font.write("Welcome to this APP", letter_spacing: 1)
        puts @banner
        sleep(5)
        system 'clear'
        User.setup_user
        sleep(3)
        system 'clear'
        menu
        sleep(2)
    end
    
    
    def self.user_input
        case $user
        when "All cities"
            @city = City.display_all_city_names
            menu_user_after_picking_city(@city)
        when "Search by city name"
            @city = City.find_by_name
            menu_user_after_picking_city(@city)
        when "Search by city climate"
            @city = City.find_by_climate
            sleep(2)

            menu_user_after_picking_city(@city)
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


    def self.menu_user_after_picking_city(city_to_save)
        main_menu = ["Back to main menu", "Save this city to trip history", "EXIT"]
        @answer = prompt.select("What would you like to do next", main_menu)
        case @answer
        when "Back to main menu"
            menu
        when "Save this city to trip history"
            UserTrip.new_trip(city_to_save)
        when "EXIT"
            puts "We are so sorry to see you go :( until next time".red.italic
            exit
        end
    end

end