require_relative 'cli_com.rb'
require_relative 'city.rb'
require_relative 'user.rb'
require 'tty'
require 'colorize'

class UserTrip < ActiveRecord::Base
    belongs_to :city
    belongs_to :user


    def self.display_user_cities_as_menu
        cities = UserTrip.all.select {|trips| trips.user_id == User.current_user.id}.map {|cities| cities.city_id}
        if cities.length == 0
            puts "No cities to display"
            sleep(4)
            CliCom.menu
        else
            cities
            user_cities_to_display = City.find(cities).map {|x| x.name}
            questions = ["BACK TO MAIN MENU" , "DELETE CITY FROM TRIPS","EXIT"]
            @answer_of_user = prompt.select("What would you like to do next", questions)
            if @answer_of_user == questions[0]
                CliCom.menu
            elsif @answer_of_user == questions[1]
                @answer_of_user = prompt.select("What city do you want to delete", user_cities_to_display)
                find_and_delete
            else
                puts "Good bye"
                exit
            end
        end
    end


    def self.find_and_delete
        city_id = City.find_by(name: @answer_of_user).id
        user_id = User.current_user.id
        trip = UserTrip.find_by(city_id: city_id, user_id: user_id)
        trip.delete
        system "clear"
        puts "DELETED #{City.find_by(name: @answer_of_user).name}".red.underline
        sleep(5)
        system "clear"
        CliCom.menu
    end
    


    def self.new_trip(argument_of_city)
        user_trip = UserTrip.find_by(city_id: argument_of_city.id, user_id: User.current_user.id)
        if UserTrip.all.include?(user_trip)
            puts "You already have this trip saved"
            sleep(3)
            CliCom.menu
        else
            UserTrip.create(city_id: argument_of_city.id, user_id: User.current_user.id)
            puts "New trip to #{argument_of_city.name} created"
            sleep(3)
            CliCom.menu
        end

    end


end