

module New_Word

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

    end
end