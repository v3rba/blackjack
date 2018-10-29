class Deck
  SUITS = %w[♠️ ♣️ ♥️ ♦️].freeze
  RANKS = %w[2 3 4 5 6 7 8 9 10 J Q K A].freeze

  def initialize
    @cards = build_deck
  end

  def self.build_deck
    @cards = []
    SUITS.each do |suit|
      RANKS.each do |rank|
        @cards << Card.new(rank, suit)
      end
    end
    @cards.shuffle!
  end

  def take_a_card
    @cards.pop
  end
end
