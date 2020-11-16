require 'tty-prompt'
require 'colorize'

class User < ActiveRecord::Base
    has_many :user_trips
    has_many :cities, through: :user_trips

    def self.setup_user
        system "clear"
        prompt = TTY::Prompt.new
        menu = ["New User", "Existing User", "Exit"]
        user_input = prompt.select("What's your status?", menu)
        if user_input == "New User"
          self.create_new_user
        elsif user_input == "Existing User"
          self.find_existing_user
        else user_input == "Exit"
          puts "Thank you for using our app"
          exit
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
            #binding.pry
            puts "Username already taken"
            create_new_user
          else
            $new_user = User.create(result)
            puts "New user created! Welcome, #{$new_user.name}!"
          end
          $new_user
        end

      def self.find_existing_user
        puts "Please enter username:"
        user_name = gets.chomp
        prompt = TTY::Prompt.new
        password = prompt.mask("Please enter password:")
        $current_existing_user = User.find_by(user_name: user_name)
        if User.all.map { |user| user.user_name }.include?(user_name) && $current_existing_user.password == password
          puts "Welcome back, #{$current_existing_user.name}!".green.italic
        else
          puts "Password and/or username is incorrect please try again:".red.underline
          find_existing_user
        end
      end


      def self.current_user
        if $current_existing_user
          $current_existing_user
        else
          $new_user
        end
      end

end