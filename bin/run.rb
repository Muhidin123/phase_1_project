require_relative '../config/environment'
def prompt
    TTY::Prompt.new
end

user = CliCom.new
user.welcome