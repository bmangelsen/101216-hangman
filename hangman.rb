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
      masked_word += x + " "
    else
      masked_word += "_ "
    end
  end
  puts masked_word
  return masked_word
end

def reply_test (play)
  until play == "y" || play == "n"
    puts "You didn't say y or n. Try again."
    play = gets.chomp
  end
  return play
end

def user_word_display(guesses)
  puts "You've guessed the following letters so far:"
  p guesses
end


while play_again == "y"
  hangman_word = word_list.sample.split("")
  user_guesses = []
  chances = 8
  while chances >= 1
    puts "Guess a letter!"
    user_guess = gets.chomp
    if user_guesses.include?(user_guess)
      puts "You already guessed that letter, try again"
      user_word_display(user_guesses)
    else
      if letter_test(user_guess) && word_test(hangman_word,user_guess)
        user_guesses << user_guess
        word = display(hangman_word,user_guesses)
        user_word_display(user_guesses)
        chances -=1
      elsif letter_test(user_guess) && !word_test(hangman_word,user_guess)
        user_guesses << user_guess
        puts "Not in the word, try again"
        word = display(hangman_word,user_guesses)
        user_word_display(user_guesses)
        chances -=1
      else
        puts "Not a letter, try again"
      end
        if word.include?("_") && chances == 0
        puts "You failed! The word was #{hangman_word.join("")}. Would you like to play again? y/n"
        play_again = gets.chomp
        play_again = reply_test(play_again)
      elsif !(word.include?("_"))
        puts "You win! Would you like to play again? y/n"
        chances = 0
        play_again = gets.chomp
        play_again = reply_test(play_again)
      else
        puts "You have #{chances} remaining chances"
      end
    end
  end
end
