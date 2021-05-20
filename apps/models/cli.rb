require 'pry'
require 'tty-prompt'
require 'terminal-table'
require_all './apps'


class CLI
    include HangmanLogic
    @@prompt = TTY::Prompt.new
    @@word = Data::Nouns.new
    @@ufo = Data::UFO.new
    @@messages = Data::Messages.new
    

    def system_clear
        sleep(2)
        system('clear')
    end

    def main_menu
        self.system_clear

        @@messages.welcome
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
        code_word = @@word.code_word[0]
        current_string = code_word.gsub(/./ , '_')
        ufo_stage = @@ufo.abduction(0)
        guesses = []
        mistakes = 0

        until mistakes == 6 || code_word == current_string do
            
            guessed = ""
            puts "Guess the codeword:   #{current_string}"
            puts ufo_stage
            guesses.each{ |letter| guessed += "#{letter} "}
            puts guessed
            puts "Mistakes Made: #{mistakes}"

            guess = @@prompt.ask("What letter do you want to guess? \n")

            if !guess
                guess = @@prompt.ask("Doesn't seem like you made a guess, want to try again? \n")
            elsif guess.length > 1 
                guess = @@prompt.ask("Sorry you can only guess one letter at a time \n")
            elsif guesses.include? guess
                guess = @@prompt.ask("You already chose this letter! Try again! \n")
            elsif guess[/\d/]
                guess = @@prompt.ask("There are no numbers in the Code Word \n")
            elsif !code_word.include?(guess)
                guesses << guess
                mistakes += 1
                ufo_stage = @@ufo.abduction(mistakes)
                puts @@messages.random_affirmation
            elsif code_word.include?(guess)
                guesses << guess
                current_string = self.check_word(code_word, guesses)
            end

        end

    end

    def game_end
        sleep(5)
        exit!
    end
end