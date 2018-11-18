class Player
  attr_reader :cards, :name, :sum
  attr_accessor :cash

  def initialize(name)
    @name = name
    @cash = 100
    @sum = 0
    @cards = []
  end

  def take_card(deck)
    @cards << deck.cards.shift
  end

  def points
    @sum = 0
    @aces = []
    @pictures = %i[K Q J]
    @cards.each do |card|
      if card.face == :A
        @aces << card
        @sum += 11
      elsif @pictures.include?(card.face)
        @sum += 10
      else
        @sum += card.face.to_i
      end
    end
    check_aces
  end

  def check_aces
    @aces.each { @sum -= 10 if @sum > 21 }
  end

  def take_money(sum)
    @cash += sum
  end

  def deduct_money(sum)
    @cash -= sum
  end

  def reset_points
    @sum = 0
  end
end
