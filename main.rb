require './card.rb'
require './deck.rb'
require './player.rb'

class Game
  def initialize
    begin_game
  end

  def greeting
    puts "Welcome to Blackjack!"
    puts "I'm going to be the dealer, and my name is Joe Rogan."
    puts "If you don't mind me asking, what's your name?"
    name = gets.chomp
    puts "Nice to meet you, #{name}! Let's get started."
    puts
  end

  def begin_game
    greeting
    deck = Deck.new
    player = Player.new(@deck.deal_cards(2))
    dealer = Player.new(@deck.deal_cards(2))
  end

  def player_turn
  end

  def dealer_turn
  end

  def player_wins
  end

  def dealer_wins
  end

  def tie
  end

end
