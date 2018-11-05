module Commands
  def user_select
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
    else
      puts 'Unknown command'
      user_select
    end
  end

  def start_new_round
    puts "Do you want to play again? (Y/N)"
    case gets.chomp.downcase
    when 'y'
      if has_enough_money?
        play_round
      end
    when 'n'
      puts "Bye"
    end
  end

#  def start_new_round
#    puts 'Do you want play again? (Y, N)'
#    input = gets.chomp.downcase
#    case input
#    when 'y'
#      until has_enough_money?
#        play_round
#    when 'n'
#      puts 'Thanks for the game. Bye'
#      abort
#    end
#  end

  def skip_turn(player)
    puts "#{player.name} pass the turn!"
  end

  def show_cards(player, visible = true)
    puts "#{player.name}'s cards:"
    puts '|*|' * player.cards.size if visible == false
    puts player.cards if visible == true
    puts '-' * 20
  end

  def print_info(player, attr)
    puts "#{player.name}'s #{attr.to_s.capitalize}: #{player.send(attr)}"
  end

  def print_round_end(winner)
    if winner == 'Draw!'
      puts winner
    else
      puts "#{winner.name} WIN!"
    end
    [user, dealer].each { |p| print_info(p, :points) }
    [user, dealer].each { |p| print_info(p, :money) }
  end

  def game_over
    if user.money <= 0
      puts "#{user.name}, this game is over. You have lost all your money. Good bye."
    elsif dealer.money <= 0
      puts "#{user.name}, Congratulations! Dealer is out of money. You have won. Good bye"
    end
  end
end
