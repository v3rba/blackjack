class Bank
  attr_reader :bank, :bet

  def initialize
    @bank = 20
    @bet = 10
  end

  def take_bet(player)
    player.deduct_money(@bet)
  end

  def get_money(player)
    player.take_money(@bank)
  end

  def split_money(user, dealer)
    user.take_money(@bet)
    dealer.take_money(@bet)
  end
end
