module Checking
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
