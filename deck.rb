require_relative 'card'

class Deсk
  attr_reader :cards

  SUITS = %w[♠️ ♣️ ♥️ ♦️].freeze
  FACES = [2, 3, 4, 5, 6, 7, 8, 9, 10, :A, :K, :Q, :J].freeze

  def create_deck
    @cards = []
    SUITS.each do |suit|
      FACES.each do |face|
        @cards << Card.new(suit, face)
      end
    end
  end
end
