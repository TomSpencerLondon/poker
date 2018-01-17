class Game

  RANKING = [:A, :K, :Q, :J, 10, 9, 8, 7, 6, 5, 4, 3, 2]
  TRANSLATION = { A: 'Ace', K: 'King', Q: 'Queen', J: 'Jack' }

  def categorise(hand)
    return "Royal Flush" if royal_flush?(hand)
    return "Straight Flush" if straight_flush?(hand)
    return "Four of a Kind" if four_of_a_kind?(hand)
    return "Full House" if full_house?(hand)
    return "Flush" if flush?(hand)
    return "Straight" if straight?(hand)
    return "Three of a Kind" if three_of_a_kind?(hand)
    return "Two Pair" if two_pair?(hand)
    return "One Pair" if one_pair?(hand)
    "Your High Card is #{high_card(hand)}"
  end

  def high_card(hand)
    indices = ranks(hand).map{ |rank| RANKING.index(rank)}.sort
    high_index = RANKING[indices[0]]
    return high_index.is_a?(Integer) ? high_index : TRANSLATION[high_index.to_sym]
  end

  def straight?(hand)
    indices = ranks(hand).map{ |rank| RANKING.index(rank)}.sort
    consecutive?(indices) && !same_suits?(hand)
  end

  def flush?(hand)
    same_suits?(hand)
  end

  def full_house?(hand)
    one_pair?(hand) && three_of_a_kind?(hand)
  end

  def one_pair?(hand)
    RANKING.one? { |card| ranks(hand).count(card) == 2 }
  end

  def two_pair?(hand)
    RANKING.find_all { |card| ranks(hand).count(card) == 2 }.count == 2
  end

  def three_of_a_kind?(hand)
    RANKING.one? { |card| ranks(hand).count(card) == 3 }
  end

  def royal_flush?(hand)
    ranks(hand) == [:A, :K, :Q, :J, 10] && same_suits?(hand)
  end

  def straight_flush?(hand)
    indices = ranks(hand).map{ |rank| RANKING.index(rank)}.sort
    consecutive?(indices) && same_suits?(hand)
  end

  def four_of_a_kind?(hand)
    RANKING.one? { |card| ranks(hand).count(card) == 4 }
  end

  def consecutive?(ranking_indices)
    ranking_indices.each_cons(2).all? {|a, b| b == a + 1 }
  end

  def same_suits?(hand)
    suits = hand.map{ |card| card[1] }
    suits.uniq.length == 1
  end

  def ranks(hand)
    hand.map{ |card| card[0] }
  end
end

game = Game.new

game.categorise([[:J, :H], [:J, :C], [:J, :S], [:J, :D], [7, :C]])
