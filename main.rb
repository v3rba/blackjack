require './card.rb'
require './deck.rb'
require './player.rb'

puts "Welcome to Blackjack!"
puts "I'm going to be the dealer, and my name is Joe Rogan."
puts "If you don't mind me asking, what's your name?"
name = gets.chomp.capitalize
puts "Nice to meet you, #{name}! Let's get started."
puts
player = Player.new(name)
dealer = Player.new
loop do
  if player.bank.zero?
    puts 'You lose all you money, moron'
    break
  elsif dealer.bank.zero?
    puts 'Dealer dont have money anymore'
    break
  end
  puts "Your bankroll: $#{player.bank}" 
  puts "Dealer has: $#{dealer.bank}"
  GameSet.new(player, dealer).start_set
  puts 'Want to play again? (y - YES, n - NO)'
  command = gets.chomp
  break unless command.downcase == 'y'
end
