require 'pry'
require 'tty-prompt'

class CLI
    prompt = TTY::Prompt.new

    def system_clear
        sleep(2)
        system('clear')
    end

    def main_menu
        puts "Welcome to UFO Abductions"
        self.game_end
    end

    def game_end
        sleep(5)
        exit!
    end
end