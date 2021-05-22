require 'pry'
require 'tty-prompt'
require_all './apps'


class CLI
    include HangmanLogic
    include Dictionary_Methods
    include Messages
    include UFO
    @@prompt = TTY::Prompt.new
    
    def system_clear
        sleep(2)
        system('clear')
    end

    def main_menu

        self.system_clear

        self.welcome
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
        code_word = self.code_word[0]
        current_string = code_word.gsub(/./ , '_')
        ufo_stage = this.abduction(0)
        guesses = []
        wrong_guesses = []

        until wrong_guesses.length == 6 || code_word == current_string do
            
            #To display all the misakes so the user can see
            mistake_letters = ""
            wrong_guesses.each{ |letter| mistake_letters += "#{letter} "}

            #Rendering our Game Board
            puts "#{ufo_stage} \n"
            puts "Codeword:\n#{current_string} \n"
            puts mistake_letters
            puts "Incorrect Guesses:\n #{wrong_guesses.length} \n"

            #User's input
            guess = @@prompt.ask("Please enter your guess: ")
 
            #Check User's input
            if guess.length > 1  #Making sure the user doesn't input more then one letter at a time
                guess = @@prompt.ask("Sorry you can only guess one letter at a time \n")

            elsif /[^A-Za-z]/.match(guess) #Making sure if the letters don't match to let them try again
                guess = @@prompt.ask("Not a letter! Try Again! \n")

            elsif guesses.include? guess.downcase #Downcasing and checking against guesses they've already made
                guess = @@prompt.ask("You already chose this letter! Try Again! \n")

            elsif !code_word.include? guess.downcase #incorrect letter case
                
                guesses << guess.downcase
                wrong_guesses << guess.upcase
                ufo_stage = this.abduction(wrong_guesses.length)
                puts self.incorrect
                puts self.random_affirmation

                if wrong_guesses.length == 6
                    puts "Your friend got abducted"
                    puts "Better luck next time!"
                    self.game_restart?
                end

            elsif code_word.include?(guess.downcase) #correct letter case

                guesses << guess
                current_string = self.check_word(code_word, guesses)

                if code_word == current_string
                    puts "You found the Code Word! It was #{code_word} \n"
                    puts "You saved your friend! \n"
                    self.game_restart?
                end

            end
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