class Dealer
  attr_reader :name, :bankroll

  def initialize(name="Dealer")
    @name = name
    @bankroll = 100
  end

  def bet(value)
    @bankroll -= value
  end

  def add_cash(value)
    @bankroll += value
  end
end
