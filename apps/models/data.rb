

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

       def like_words(current_string)
            list = self.split_words
            
       end

    end

    class Messages
        
        def random_affirmation
            ["Aww, that's okay you'll get it next time!",
            "Practice makes perfect!",
            "Don't give up; you'll get there!",
            "You're so close; I believe in you!",
            "If at first you don't succeed, try, try again!"].sample
        end

        def welcome
            puts "Welcome to UFO Abductions"
            puts "Your friend is being Abducted!"
            puts "You only have one chance to save your friend, you have to find the Code Word to shut off the Tractor beam"
            puts "It looks like you can make 6 wrong guesses before they fully abduct them"
        end

        def incorrect
            puts "Incorrect! The tractor beam pulls the person closer "
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
",
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
",
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
",
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
",
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
",
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
"]

            return x[mistake]
        end
    end
end