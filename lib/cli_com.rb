require "tty-prompt"
require 'pp'
require 'colorize'
require_relative 'city.rb'
require_relative 'user.rb'

class CliCom

    def initialize
    end

    def prompt
        prompt = TTY::Prompt.new
    end
    
    def welcome
        font = TTY::Font.new(:starwars)
        puts font.write("Welcome to this APP", letter_spacing: 1)
        sleep(3)
        system 'clear'
        User.setup_user
        system 'clear'
        menu
    end
    
    
    def test_it
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
        test_it
    end
    
    def good_bye
        puts "We are so sorry to see you go :( until next time".red.italic
        exit
    end
end

