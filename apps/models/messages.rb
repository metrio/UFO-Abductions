module Messages

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
        ["Incorrect! The tractor beam pulls the your friend closer \n",
        "Ooo so close! Your friend is screaming for help! \n",
        "Dang! The aliens are snickering at you! \n"].sample
    end

    def good_job
        ["Wow you got it! \n", 
        "Woah! You're a code master! \n", 
        "Impressive! \n",
        "Great job! Almost there! \n"].sample
    end
    
end