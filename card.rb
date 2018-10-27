class Card
  attr_reader :rank, :suit

  def initialize(rank, suit)
    @rank = rank
    @suit = suit
  end

  def face_card?
    %w[J Q K A].include?(rank)
  end

  def ace_card?
    %w[A].include?(rank)
  end
end
