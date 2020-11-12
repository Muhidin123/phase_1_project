require 'tty-prompt'
require 'colorize'

class User < ActiveRecord::Base
    has_many :user_trips
    has_many :cities, through: :user_trips

    def self.setup_user
        system "clear"
        prompt = TTY::Prompt.new
        user_input = prompt.select("What's your status?",
          %w(New_User Existing_User))
        if user_input == "New_User"
          self.create_new_user
        else
          self.find_existing_user
        end
      end

      def self.create_new_user
        prompt = TTY::Prompt.new
        result = prompt.collect do
          name = key(:name).ask("Input your name:")
        
          user_name = key(:user_name).ask("And a new user_name please:")
        
          password = key(:password).ask("And a new password please: ")
          end
          if User.find_by(user_name: result[:user_name])
            puts "Username already taken"
            create_new_user
          else
            current_user = User.create(result)
            puts "New user created! Welcome, #{current_user.name}!"
          end
          current_user
        end

      def self.find_existing_user
        puts "Please enter username:"
        user_name = gets.chomp
        prompt = TTY::Prompt.new
        password = prompt.mask("Please enter password:")
        current_user = User.find_by(user_name: user_name)
        if User.all.map { |user| user.user_name }.include?(user_name) && current_user.password == password
          puts "Welcome back, #{current_user.name}!".green.italic
        else
          puts "Password and/or username is incorrect please try again:".red.underline
          find_existing_user
        end
      end


      def self.all_user_trips
        UserTrip.all.select {|trips| trips.user_id == self.id}
        #binding.pry
      end


      def self.user_cities_by_name
        self.all_user_trips.map do |city| 
          city.name
        end
      end

end