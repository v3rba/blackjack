require './game.rb'
require './player.rb'
require './dealer.rb'
require './user.rb'
require './card.rb'
require './deck.rb'

puts "Welcome to Blackjack!"
puts "I'm going to be the dealer, and my name is Joe Rogan."
puts "If you don't mind me asking, what's your name?"
username = gets.chomp.capitalize
puts "Nice to meet you, #{username}! Let's get started."
user = User.new(username)
dealer = Dealer.new
game = Game.new(user, dealer)

game.play_round
