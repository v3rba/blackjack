require_relative 'cards_deck'
require_relative 'hand'

class GameSet
  BET_SIZE = 10

  def initialize(player, dealer)
    @player = player
    @dealer = dealer
    @player.bet(BET_SIZE)
    @dealer.bet(BET_SIZE)
    @bank = BET_SIZE * 2
    @deck = CardsDeck.new
    @player_hand = Hand.new
    @dealer_hand = Hand.new
  end

  def start_set
    take_start_cards

    if @player_hand.points == 21 || @dealer_hand.points == 21
      puts 'BLACKJACK!'
      result
    else
      print_info
      user_select
    end
  end

  private

  def print_info(show_dealer = false)
    puts " You: #{@player_hand.cards(:visible)}, #{@player_hand.points} points"
    puts "Dealer: #{@dealer_hand.cards(show_dealer)}, #{show_dealer ? @dealer_hand.points : '* '} points"

  end

  def user_select
    puts "Select action:"
    puts "(T)ake card, (S)kip turn, (O)pen cards"
    loop do
      command = gets.chomp.downcase
      case command
      when 't'
          @player_hand.add_card(@deck.take_a_card)
          dealer_turn
      when 's'
          dealer_turn
      when 'o'
          break
      else
        puts 'Type error!'
      end
    end
    result
  end

  def dealer_turn
    @dealer_hand.add_card(@deck.take_a_card) if @dealer_hand.points < 18
  end

  def result
    print_info(:show_dealer)
    player_points = @player_hand.points
    dealer_points = @dealer_hand.points
    if player_points == dealer_points
      puts "Looks like we're tied on games won."
      @player.add_cash(@bank / 2)
      @dealer.add_cash(@bank / 2)
    elsif player_points == 21
      player_win
    elsif dealer_points == 21
      dealer_win
    elsif player_points < 21 && dealer_points < 21
      player_points > dealer_points ? player_win : dealer_win
    else
      player_points > dealer_points ? dealer_win : player_win
    end
  end

  def player_win
    puts 'Congratulations! You win!'
    @player.add_cash(@bank)
  end

  def dealer_win
    puts '"Oops! You lose.'
    @dealer.add_cash(@bank)
  end

  def take_start_cards
    2.times do
      @player_hand.add_card(@deck.take_a_card)
      @dealer_hand.add_card(@deck.take_a_card)
    end
  end
end
