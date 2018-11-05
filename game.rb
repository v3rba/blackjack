require_relative 'player'
require_relative 'card'
require_relative 'deck'
require_relative 'commands'
require_relative 'checking'

class Game
  include Commands
  include Checking
  attr_accessor :user, :dealer, :deck, :bank

  def initialize(user, dealer = Dealer.new)
    @user = user
    @dealer = dealer
    @bank = 0
  end

  def play_round
    new_round
    until has_enough_money? && round_end?
      user_turn
      dealer_turn
    end
    open_cards
  end
  

  def new_round
    print_info(user, :money)
    @deck = Deck.new
    @deck.shuffle!
    [user, dealer].each do |player|
      player.cards = []
      player.to_bet
      2.times { take_card(player) }
    end
    @bank = 20
  end

  def user_turn
    show_cards(dealer, false)
    show_cards(user)
    user_select
  end

  def dealer_turn
    if dealer.take_card?
      take_card(dealer)
    else
      skip_turn(dealer)
    end
  end

  def take_card(player)
    player.cards << deck.pull_out
  end

  def open_cards
    [user, dealer].each { |p| show_cards(p, true) }
    winner = check_winner
    take_bank(winner)
    print_round_end(winner)
    start_new_round
  end

  def take_bank(winner)
    if winner == 'Draw!'
      user.money += @bank / 2
      dealer.money += @bank / 2
    else
      winner.money += @bank
    end
  end

  def has_enough_money?
    if user.has_money? && dealer.has_money?
      true
    else
      game_over
      exit
    end
  end
end
