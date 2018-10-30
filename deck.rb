class Deck
  attr_reader :cards

  def initialize
    @cards = []
    suits = %w[♠️ ♣️ ♥️ ♦️]
    ranks = [:a, :k, :q, :j, 2, 3, 4, 5, 6, 7, 8, 9, 10]
    ranks.each do |rank|
      suits.each do |suit|
        @cards << Card.new(rank, suit)
      end
    end
  end

  def shuffle!
    @cards.shuffle!
  end

  def pull_out
    @cards.shift
  end
end
