require 'pry'
require 'tty-prompt'
require 'terminal-table'
require_relative './data'


class CLI
    @@prompt = TTY::Prompt.new
    @@word = Data::Nouns.new
    @@ufo = Data::UFO.new
    

    def system_clear
        sleep(2)
        system('clear')
    end

    def main_menu
        self.system_clear
        puts "Welcome to UFO Abductions"
        puts "Your friend is being Abducted!"
        puts "You only have one chance to save your friend, you have to find the Code Word to shut off the Tractor beam"
        puts "It looks like you can make 6 wrong guesses before they fully abduct them"
        choices = {"Yes" => 1, "No" => 2}
        choice = @@prompt.select("Are you ready to save your friend? (Y/N) ", choices)
            if choice == 1
                puts "Alright get ready"
            else choice == 2
                puts "Bye friend! See you on another planet!"
                self.system_clear
                exit!
            end
            sleep(1.5)
        self.hangman_start
    end

    def hangman_start
        code_word = @@word.code_word
        current_string = code_word[0].gsub(/./ , '_')
        guesses = []
        ## for the game to start I need a hangman method that takes a string
        ## and a letter

        ## we will keep playing until either 6 wrong_guesses.length == 6 or the current_string doesn't look like word
        ##
        ## 1. Show UFO abducting friend and word
        ## 2. Ask User for a letter
        ## 3. Hangman method works
        ## 4. Check status and print an affirmation every turn
        ## 5. 

        
        ufo_stage = @@ufo.abduction(0)

        puts current_string
        puts ufo_stage

        

    end

    def game_end
        sleep(5)
        exit!
    end
end