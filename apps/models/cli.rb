require 'pry'
require 'tty-prompt'
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
        wrong_guesses = []
        mistakes = 0

        until mistakes == 6 || code_word == current_string do
            
            mistake_letters = ""
            wrong_guesses.each{ |letter| mistake_letters += "#{letter} "}

            puts "#{ufo_stage} \n"
            puts "Codeword:\n#{current_string} \n"
            puts mistake_letters
            puts "Incorrect Guesses:\n #{mistakes} \n"

            guess = @@prompt.ask("Please enter your guess: ")

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
                wrong_guesses << guess.upcase
                mistakes += 1
                ufo_stage = @@ufo.abduction(mistakes)
                
                if(mistakes != 6)
                    puts @@messages.incorrect
                    puts @@messages.random_affirmation
                else
                    puts @@messages.incorrect
                end

            elsif code_word.include?(guess)
                guesses << guess
                current_string = self.check_word(code_word, guesses)
            end
        end

        if mistakes == 6
            puts "Your friend got abducted"
            puts "Better luck next time!"
            self.game_restart?
        elsif code_word == current_string
            puts "You found the Code Word! It was #{code_word} \n"
            puts "You saved your friend! \n"
            self.game_restart?
        end

    end

    def game_restart?
        choices = {"Yes" => 1, "No" => 2}
        choice = @@prompt.select("Would you like to play again? (Y/N)\n ", choices)
            if choice == 1
                puts "Alright Let's do this again!!"
                self.hangman_start
            else choice == 2
                puts "Sorry to see you go, hope you play again soon"
                self.game_end
            end
    end

    def game_end
        sleep(5)
        exit!
    end
end