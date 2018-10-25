class Player

  attr_accessor :cards, :bankroll

  def initialize
    @name = name
    @bankroll = 100
    @cards = Deck.new
  end

  def add_card(card)
    cards << card
  end

end
