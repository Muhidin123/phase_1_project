require_relative 'cli_com.rb'
require_relative 'city.rb'
require_relative 'user.rb'
require 'tty'

class UserTrip < ActiveRecord::Base
    belongs_to :city
    belongs_to :user





    def self.display_user_cities_as_menu
        #prompt = TTY:Prompt.new
        cities = UserTrip.all.select {|trips| trips.user_id == User.current_user.id}.map {|cities| cities.city_id}
        cities = City.find(cities).map {|x| x.name}
        @answer_of_user = prompt.select("Choose city name to delete:", cities)
        #@answer_of_user
        #binding.pry
    end


    def self.find_and_delete
        display_user_cities_as_menu
        city_id = City.find_by(name: @answer_of_user).id
        user_id = User.current_user.id
        trip = UserTrip.find_by(city_id: city_id, user_id: user_id)
        trip.destroy
        puts "DELETED"
    end
    


    def self.new_trip
        UserTrip.create(city_id: City.display_all_city_names.id, user_id: User.current_user.id)
        puts "New trip to #{City.display_all_city_names.name} created"
    end




end