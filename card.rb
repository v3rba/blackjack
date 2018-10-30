class Card
  attr_reader :rank, :suit, :points

  HIDDEN = '**'.freeze

  def initialize(rank, suit)
    @rank = rank
    @suit = suit
    @points = points
  end

  def face_card?
    %w[J Q K A].include?(rank)
  end

  def ace_card?
    %w[A].include?(rank)
  end

  def points
    return 11 if ace_card?
    return 10 if face_card?
    @rank
  end

  def to_s
    "#{@rank}#{@suit}"
  end

  def hidden
    HIDDEN
  end
end
