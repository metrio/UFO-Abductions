module HangmanLogic
    def check_word(word, letters)
        current_string = ""
        word.split('').each do |i|
            if letters.include? i
                current_string += i
            else
                current_string += "_"
            end 
        end
        return current_string.downcase
    end
end