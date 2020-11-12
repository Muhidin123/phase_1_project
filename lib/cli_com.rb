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
            City.display_all_city_names
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
end

