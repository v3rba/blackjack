class Deck

  SUITS = %w[♠️ ♣️ ♥️ ♦️].freeze
  RANKS = %w[2 3 4 5 6 7 8 9 10 J Q K A].freeze

  attr_reader :cards

  def initialize
    @cards = Deck.build_deck
  end

  def build_deck
    @cards = []
    SUITS.each do |suit|
      RANKS.each do |rank|
        @cards << Card.new(rank, suit)
      end
    end
    @cards.shuffle!
  end

end