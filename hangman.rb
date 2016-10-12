word_list=["vulture", "toucan", "moose", "elephant", "alpaca", "alligator",
  "chimpanzee", "dolphin", "tarantula", "sparrow", "wallaby", "wombat"]

puts "Welcome to hangman! You get eight chances to guess the word."
play_again = "y"

while play_again == "y"

  chances = 0
  hangman_word = word_list.sample.split("")

  #hangman_word.length.times do user_guesses << "_" end

    while chances < 9

      index = nil
      puts "Guess a letter!"
      user_guess = gets.chomp

      if letter_test(user_guess) == true    #run first
        index = word_test(user_guess)
        chances +=1
      else
        puts "Not a letter, try again"
      end
                                            #run second


  #method to display current board

  #method to iterate over word array and return index number if letter is part of it

def word_test(letter)
  if hangman_word.include? letter
    return hangman_word.index letter
  else
    puts "Not part of the word!"
  end


def letter_test (letter)
  ("a".."z").include?(letter.downcase)
end
