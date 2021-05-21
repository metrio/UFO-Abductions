require_relative 'hangman'

module Data

    class Nouns

       def split_words
            noun_dictionary = open("db/nouns.txt")
            noun_dictionary.each_line.collect do  | line | 
                line.downcase.split(/[^[:alpha:]]/).reject(&:empty?)
            end 
       end

       def code_word
            list = self.split_words
            list.sample
       end

    #    def like_words(current_string)
    #         list = self.split_words

    #         limited_list = list.select do | word |
    #             word.length == current_string.length
    #         end

    #         limited_list.select do | word |
                
    #         end
            
    #    end

    end

    class Messages
        
        def random_affirmation
            ["Aww, that's okay you'll get it next time! \n",
            "Practice makes perfect! \n",
            "Don't give up; you'll get there! \n",
            "You're so close; I believe in you! \n",
            "If at first you don't succeed, try, try again! \n"].sample
        end

        def welcome
            puts "Welcome to UFO Abductions \n"
            puts "Your friend is being Abducted! \n"
            puts "You only have one chance to save your friend, you have to find the Code Word to shut off the Tractor beam\n"
            puts "It looks like you can make 6 wrong guesses before they fully abduct them \n"
        end

        def incorrect
            puts "Incorrect! The tractor beam pulls the your friend closer \n"
        end

        
    end

    class UFO
        
        def abduction(mistake)
        x = ["                 .
                 |
              .-\"^\"-.
             /_....._\\
         .-\"`         `\"-.
        (  ooo  ooo  ooo  )
         '-.,_________,.-'
              /     \\
             /       \\
            /    O    \\
           /   --|--   \\
          /      |      \\
         /      / \\      \\
 \n",
"                 .
                 |
              .-\"^\"-.
             /_....._\\
         .-\"`         `\"-.
        (  ooo  ooo  ooo  )
         '-.,_________,.-'
              /     \\
             /   O   \\
            /  --|--  \\
           /     |     \\
          /     / \\     \\
         /               \\
",
"                 .
                 |
              .-\"^\"-.
             /_....._\\
         .-\"`         `\"-.
        (  ooo  ooo  ooo  )
         '-.,_________,.-'
              /  O  \\
             / --|-- \\
            /    |    \\
           /    / \\    \\
          /             \\
         /               \\
\n",
"                 .
                 |
              .-\"^\"-.
             /_....._\\
         .-\"`         `\"-.
        (  ooo  ooo  ooo  )
         '-.,_________,.-'
              /--|--\\
             /   |   \\
            /   / \\   \\
           /           \\
          /             \\
         /               \\
\n",
"                 .
                 |
              .-\"^\"-.
             /_....._\\
         .-\"`         `\"-.
        (  ooo  ooo  ooo  )
         '-.,_________,.-'
              /  |  \\
             /  / \\  \\
            /         \\
           /           \\
          /             \\
         /               \\
\n",
"
                 .
                 |
              .-\"^\"-.
             /_....._\\
         .-\"`         `\"-.
        (  ooo  ooo  ooo  )
         '-.,_________,.-'
              / / \\ \\
             /       \\
            /         \\
           /           \\
          /             \\
         /               \\
\n",
"
                 .
                 |
              .-\"^\"-.
             /_....._\\
         .-\"`         `\"-.
        (  ooo  ooo  ooo  )
         '-.,_________,.-'
              /     \\
             /       \\
            /         \\
           /           \\
          /             \\
         /               \\
\n"]

            return x[mistake]
        end
    end
end