require 'pp'
require 'tty-font'

class City < ActiveRecord::Base
    
    has_many :user_trips
    has_many :users, through: :user_trips
    
    def prompt
        TTY::Prompt.new
    end

    def self.display_all_city_names
        city_names_for_menu = self.all.order(:name).map do |city|
            city.name
        end
        user_city_input = prompt.select("Select your city", city_names_for_menu)
        displayed_city = City.find_by(name: user_city_input)
        cities(displayed_city)
        displayed_city
    end

    ### METHOD TO FIND NAME EVEN IF NOT GIVEN FULL NAME ###

    # def self.find_by_name
    #     var = prompt.ask("Search by city name if it's in my database I'll give you info: ")
    #     pp result = City.where('name like?', "%#{var}%")
    # end

    ################################################################


    def self.find_by_name
        user_input_of_city_name= prompt.ask("Search by city name if it's in my database I'll give you info: ")
        @result = City.find_by(name: user_input_of_city_name)
        cities(@result)
        @result
    end



    def self.find_by_climate
        input = prompt.select("Enter avg temp u want:", %w(60F 65F 63F 69F 75F))
        @input_user = City.find_by(average_temp: input)
        cities(@input_user)
        @input_user
    end


    def self.display_cities_of_user
        all_user_cities = UserTrip.all.select {|trips| trips.user_id == User.current_user.id}.map {|cities| cities.city_id}
        user_cities = City.find(all_user_cities)
        user_cities.each {|x| cities(x)}
        sleep(3)
        user_cities
    end

    def self.cities(city)
        puts "Name: #{city.name}\n"
        puts "State: #{city.state}\n"
        puts "Population: #{city.population}\n"
        puts "Area: #{city.area}\n"
        puts "Average temperature: #{city.average_temp}\n"
        puts "What to eat and drink: #{city.eat_drink}\n"
        puts "Visit this restaurant: #{city.restaurant}\n"
        puts "Landmarks: #{city.landmark}\n"
        puts "Activites: #{city.activity}\n"
        puts "-------------------------------------"
    end

end