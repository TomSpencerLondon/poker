require 'game'

describe Game do

  describe "#categorise" do
    it "returns a 'royal flush'" do
      hand = [[:A, :H], [:K, :H], [:Q, :H], [:J, :H], [10, :H]]
      expect(subject.categorise(hand)).to eq("Royal Flush")
    end

    it "returns a 'straight flush'" do
      hand = [[9, :C], [8, :C], [7, :C], [6, :C], [5, :C]]
      expect(subject.categorise(hand)).to eq("Straight Flush")
    end

    it "returns a 'four of a kind'" do
      hand = [[:J, :H], [:J, :C], [:J, :S], [:J, :D], [7, :C]]
      expect(subject.categorise(hand)).to eq("Four of a Kind")
    end
  end

end
