require 'pry'
require 'tty-prompt'
require_relative './new_word'


class CLI
    prompt = TTY::Prompt.new

    def system_clear
        sleep(2)
        system('clear')
    end

    def main_menu
        puts "Welcome to UFO Abductions"
        puts "Your friend is being Abducted!"
        puts "You only have one chance to save your friend, you have to find the Code Word to shut off the Tractor beam"
        puts "It looks like you can make 6 wrong guesses before they fully abduct them"
        self.hangman_start
    end

    def hangman_start
        ## for the game to start I need a hangman method that takes a string
        ## and a letter

        ## we will keep playing until either 6 wrong_guesses.length == 6 or the current_string doesn't look like word
        ##
        ## 1. Show UFO abducting friend and word
        ## 2. Ask User for a letter
        ## 3. Hangman method works
        ## 4. Check status and print an affirmation every turn
        ## 5. 

        
        word = New_Word::Nouns.new

        puts word.code_word

    end

    def game_end
        sleep(5)
        exit!
    end
end