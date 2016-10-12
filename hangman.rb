word_list=["vulture", "toucan", "moose", "elephant", "alpaca", "alligator",
  "chimpanzee", "dolphin", "tarantula", "sparrow", "wallaby", "wombat"]

puts "Welcome to hangman! You get 8 chances to guess the word."
play_again = "y"


def word_test (word,letter)
  word.include?(letter)
end

def letter_test (letter)
  ("a".."z").include?(letter.downcase)
end

def display (chars,guesses)
  masked_word = ""
  chars.each do |x|
    if guesses.include?(x)
      masked_word += x
    else
      masked_word += "_"
    end
  end
  puts masked_word
end


while play_again == "y"

    if play_again == "y"
      chances = 8
    else play_again !="y" && play_again !="n"
      until play_again == "y" || play_again == "n"
        puts "You didn't hit y or n! Try again"
        play_again = gets.chomp
      end
    end
  end

  hangman_word = word_list.sample.split("")
  user_guesses = []

    while chances > 1

      puts "Guess a letter!"
      user_guess = gets.chomp
      if user_guesses.include?(user_guess)
        puts "You already guessed that letter, try again"
      else
        user_guesses << user_guess

        if letter_test(user_guess) && word_test(hangman_word,user_guess)
          display(hangman_word,user_guesses)
          chances -=1
        elsif letter_test(user_guess) && !word_test(hangman_word,user_guess)
          puts "Not in the word, try again"
          chances -=1
        else
          puts "Not a letter, try again"
        end

        if display(hangman_word,user_guesses) != hangman_word.join("") && chances == 0
          puts "You failed! Would you like to play again? y/n"
          play_again = gets.chomp
        elsif display(hangman_word,user_guesses) == hangman_word.join("")
          puts "You win! Would you like to play again? y/n"
          play_again = gets.chomp
        else
          puts "You have #{chances} remaining chances"
        end

      end
    end


end
