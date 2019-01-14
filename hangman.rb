puts "Welcome to Hangman"
print "Please enter a word for your opponent:  "
target_word = gets.chomp.downcase

sleep 2
system "clear"

guess_counter = 5
character_count = target_word.length
target_string = ''
user_entered = ''

character_count.times do
  target_string += '-'
end

puts "Your oppoent has suppled a #{character_count} letter word"

while guess_counter > 0 do

  if guess_counter == 1
    guess_or_guesses = "guess"
  else
    guess_or_guesses = "guesses"
  end

  puts "You have #{guess_counter} #{guess_or_guesses} left"
  print "Please enter a guess:  "

  letter_guess = gets.chomp.downcase

  if user_entered.include?(letter_guess)
    puts "You already guessed #{letter_guess}"
  end

  user_entered += letter_guess

  i = 0;
  while i < character_count do
    if target_word[i] == letter_guess
      target_string[i] = letter_guess
    end
    i += 1
  end

  if !target_word.include?(letter_guess)
    guess_counter -= 1
  end

  puts ""
  puts "Here is where you stand:  #{target_string}"
  puts ""

  if guess_counter == 0
    puts "Game Over :( Sorry, you lose"
  end

  if !target_string.include?('-')
    puts "Winner!  You did it!"
    guess_counter = 0
  end

end
