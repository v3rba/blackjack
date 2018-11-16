class Round
  def initialize(user, interface)
    @user = user
    @dealer = Dealer.new
    @bank = 0
    @interface = interface
    @deck = Deck.new
  end

  def menu
    puts 'Select action:'
    puts '(T)ake card, (S)kip turn, (O)pen cards'
    choice = gets.chomp.downcase
    case choice
    when 't'
      take_card(user)
    when 's'
      skip_turn(user)
    when 'o'
      open_cards
    end
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
    menu
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
    start_round
  end

  def take_bank(winner)
    if winner == 'Draw!'
      user.money += @bank / 2
      dealer.money += @bank / 2
    else
      winner.money += @bank
    end
  end

  def enough_money?
    if user.has_money? && dealer.has_money?
      true
    else
      game_over
      exit
    end
  end

  def check_winner
    if (user.points > dealer.points) && user.points <= 21
      user
    elsif (user.points < dealer.points) && dealer.points > 21
      user
    elsif user.points == dealer.points
      'Draw!'
    else
      dealer
    end
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
end
