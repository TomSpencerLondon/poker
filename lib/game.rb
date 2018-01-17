class Game

  RANKING = [:A, :K, :Q, :J, 10, 9, 8, 7, 6, 5, 4, 3, 2]

  def categorise(hand)
    puts "Royal Flush" if royal_flush?(hand)
    puts "Straight Flush" if straight_flush?(hand)
    puts "Four of a Kind" if four_of_a_kind?(hand)
  end

  def royal_flush?(hand)
    ranks(hand) == [:A, :K, :Q, :J, 10] && same_suits?(hand) ? true : false
  end

  def straight_flush?(hand)
    indices = ranks(hand).map{ |rank| RANKING.index(rank)}.sort
    consecutive?(indices) && same_suits?(hand) ? true : false
  end

  def four_of_a_kind?(hand)
    array = ranks(hand)
    array.select{ |x| ranks(hand).count(x) == 4 }.count == 4
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
