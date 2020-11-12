class City < ActiveRecord::Base

    has_many :user_trips
    has_many :users, through: :user_trips


    def self.display_all_cities
        self.all.map do |city|
            city.name
        end
    end

    def self.find_by_name(output)
        City.all.select do |city|
            city.name == output
            #binding.pry
        end
    end
end