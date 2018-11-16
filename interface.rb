class Interface

  def start_round
    loop do
      puts 'Wanna play? (Y/N)'
      case gets.chomp
      when 'y'
        new_round
        until round_end? && enough_money?
          user_turn
          dealer_turn
        end
        open_cards
      when 'n'
        puts 'Bye'
        abort
      end
    end
  end

end