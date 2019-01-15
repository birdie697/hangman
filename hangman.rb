puts "Welcome to Hangman"
print "Please enter a word for your opponent:  "
target_word = gets.chomp.downcase

sleep 2
system "clear"

guess_counter = 5
character_count = target_word.length
target_string = ''
user_entered = ''
display_string = ''

x = 0
while x < character_count do
  display_string += '_' + ' '
  target_string += target_word[x] + ' '
  x += 1
end

def guesses(guess_counter)
  if guess_counter == 1
    return "guess"
  else
    return "guesses"
  end
end

puts "Your oppoent has suppled a #{character_count} letter word"

while guess_counter > 0 do

  puts "You have #{guess_counter} #{guesses(guess_counter)} left"
  print "Please enter a guess:  "

  letter_guess = gets.chomp.downcase

  if user_entered.include?(letter_guess)
    puts "You already guessed #{letter_guess}"
  end

  user_entered += letter_guess

  i = 0;
  while i < display_string.length do
    if target_string[i] == letter_guess
      display_string[i] = letter_guess
    end
    i += 1
  end

  if !target_word.include?(letter_guess)
    guess_counter -= 1
  end

  puts ""
  puts "Here is where you stand:  #{display_string}"
  puts ""

  if guess_counter == 0
    puts "Game Over :( Sorry, you lose"
  end

  if !display_string.include?('_')
    puts "Winner!  You did it!"
    guess_counter = 0
  end

end
