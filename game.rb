require './player.rb'
require './card.rb'
require './deck.rb'

class Game
  attr_accessor :user, :dealer, :deck, :bank

  def initialize(user, dealer = Dealer.new)
    @user = user
    @dealer = dealer
    @bank = 0
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

  def play_round
    new_round
    until round_end?
      user_turn
      dealer_turn
    end
    open_cards
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
  
  def skip_turn(player)
    puts "#{player.name} pass the turn!"
  end

  def open_cards
    [self.user, self.dealer].each {|p| show_cards(p, true)}
    winner = check_winner
    take_bank(winner)
    print_round_end(winner)
    start_new_round
  end

  def take_bank(winner)
    if winner == "Draw!"
      user.money += @bank / 2
      dealer.money += @bank / 2
    else
      winner.money += @bank
    end
  end

  def user_select
    puts "Select action:"
    puts "(T)ake card, (S)kip turn, (O)pen cards"
    choise = gets.chomp.downcase
    case choise
    when 't'
      take_card(user)
    when 's'
      skip_turn(user)
    when 'o'
      open_cards
    else
      puts 'Type error!'
    end 
  end

  def show_cards(player, visible = true)
    puts "#{player.name}'s cards:"
    puts '|*|' * player.cards.size if visible == false
    puts player.cards if visible == true
    puts '-' * 10
  end

  def start_new_round
    puts 'Do you want play again? (Y, N)'
    choise = gets.chomp.downcase
    if choise == 'y'
      play_round
    else
      exit
    end
  end

  def print_info(player, attr)
    puts "#{player.name}'s #{attr.to_s.capitalize}: #{player.send(attr)}"
  end

  def print_round_end(winner)
    if winner == "Draw!"
      puts winner
    else
      puts "#{winner.name} WIN!"
    end
    [user, dealer].each {|p| print_info(p, :points)}
    [user, dealer].each {|p| print_info(p, :money)}
  end

  def round_end?
    if user.limit_cards? && dealer.limit_cards?
      true
    elsif user.limit_cards? && !dealer.take_card?
      true
    else
      false
    end
  end

  def check_winner
    if (user.points > dealer.points) && user.points <= 21
      user
    elsif user.points == dealer.points
      "Draw!"
    else
      dealer
    end
  end
end
