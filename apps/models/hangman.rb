def hangman(word, letter)
    
    current_string = ""
  
    word.split('').each do |i|
    
    if letter.include? i
      current_string += i
    else
      current_string += "_"
    end
    
  end
  return current_string.downcase
end