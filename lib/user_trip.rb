require_relative 'cli_com.rb'
require_relative 'city.rb'
require_relative 'user.rb'
require 'tty'

class UserTrip < ActiveRecord::Base
    belongs_to :city
    belongs_to :user





    def self.display_user_cities_as_menu
        prompt = TTY:Prompt.new
        cities = City.display_cities_of_user.map {|cities| cities.name}
        @answer_of_user = prompt.select("Choose city name", cities)
        #@answer_of_user
        binding.pry
    end

    ############## TEST OF DELETE METHOD ##############


    def self.find_and_delete
        display_user_cities_as_menu
        var1 = City.find_by(name: @answer_of_user).id
        var2 = UserTrip.select do |trips| trips.User.current_user.id
        end
        UserTrip.find_by(city_id: var1, user_id: var2).delete
        puts "DELETED"
    end
    
    ############## END TEST OF DELETE METHOD ##############

    def self.new_trip
        UserTrip.create(city_id: City.display_all_city_names.id, user_id: User.current_user.id)
        puts "New trip to #{City.display_all_city_names.name} created"
    end




end




# if @answer_of_user == main_menu[1]
#     CliCom.menu
# elsif 
#     UserTrip.find_and_delete
# else
#     puts "We are so sorry to see you go :( until next time".red.italic
#     exit
# end
# end