class Player
  attr_accessor :name, :money, :cards

  def initialize(name)
    @name = name
    @money = 100
    @cards = []
  end

  def points
    points = 0
    cards.each do |card|
      points += if card.ace? && points <= 10
                  card.get_points.last
                elsif card.ace?
                  card.get_points.first
                else
                  card.get_points
      end
    end
    points
  end

  def to_bet
    @money -= 10
  end

  def limit_cards?
    cards.size == 3
  end

end
