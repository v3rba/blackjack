require_relative 'player'
require_relative 'card'
require_relative 'deck'
require_relative 'interface'
require_relative 'user'
require_relative 'game'
require_relative 'dealer'

puts 'Welcome to Blackjack!'
puts "I'm going to be the dealer, and my name is Joe Rogan."
puts "If you don't mind me asking, what's your name?"
username = gets.chomp.capitalize
puts "Nice to meet you, #{username}! Let's get started."
user = User.new(username)
dealer = Dealer.new
game = Game.new(user, dealer)

game.play_round
