class Dealer < Player
  def initialize(name = 'Dealer')
    super
  end

  def take_card?
    points <= 18
  end
end
