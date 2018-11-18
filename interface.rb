class Interface
  attr_reader :choice

  def victory_report
    puts 'You win'
  end

  def defeat_report
    puts 'You lose'
  end

  def draw_report
    puts 'Draw'
  end

  def message_to_continue
    puts 'Do you want to continue? y/n'
    @choice = gets.chomp
  end

  def selection_error
    puts 'Choose from the offered options'
  end

  def user_cards_message(player)
    puts 'Your cards:'
    player.cards.each do |card|
      puts "#{card.face}#{card.suit}"
    end
  end

  def user_points_message(player)
    puts "Your points: #{player.sum}"
  end

  def dealer_cards_message(player)
    puts 'Dealer cards:'
    player.cards.each do |card|
      puts "#{card.face}#{card.suit}"
    end
  end

  def unknown_dealer_cards
    puts %(
    Dealer cards:
    1.**
    2.**
   )
  end

  def dealer_points_message(player)
    puts "Dealer points: #{player.sum}"
  end

  def user_chioce
    puts %(
    1. Skip
    2. Take card
    3. Open cards
    )
    @choice = gets.chomp
  end

  def enter_name
    puts 'Enter name: '
    @name = gets.chomp
  end
end
