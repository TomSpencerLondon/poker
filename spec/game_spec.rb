require 'game'

describe Game do

  let(:output) { StringIO.new }

  describe "#categorise" do
    it "returns a 'Royal Flush'" do
      hand = [[:A, :H], [:K, :H], [:Q, :H], [:J, :H], [10, :H]]
      expect(subject.categorise(hand)).to eq("Royal Flush")
    end

    it "returns a 'Straight Flush'" do
      hand = [[9, :C], [8, :C], [7, :C], [6, :C], [5, :C]]
      expect(subject.categorise(hand)).to eq("Straight Flush")
    end

    it "returns a 'Four of a Kind'" do
      hand = [[:J, :H], [:J, :C], [:J, :S], [:J, :D], [7, :C]]
      expect(subject.categorise(hand)).to eq("Four of a Kind")
    end

    it "returns a 'Full House'" do
      hand = [[:J, :C], [:J, :D], [:J, :S], [6, :H], [6, :C]]
      expect(subject.categorise(hand)).to eq("Full House")
    end

    it "returns a 'Three of a Kind'" do
      hand = [[:J, :C], [:J, :D], [:J, :S], [6, :H], [2, :C]]
      expect(subject.categorise(hand)).to eq("Three of a Kind")
    end

    it "returns a 'One Pair'" do
      hand = [[:J, :C], [:J, :D], [:K, :S], [6, :H], [2, :C]]
      expect(subject.categorise(hand)).to eq("One Pair")
    end

    it "returns a 'Two Pair'" do
      hand = [[:J, :C], [:J, :D], [:K, :S], [:K, :H], [6, :C]]
      expect(subject.categorise(hand)).to eq("Two Pair")
    end

    it "returns a 'Flush'" do
      hand = [[5, :D], [8, :D], [10, :D], [:J, :D], [:A, :D]]
      expect(subject.categorise(hand)).to eq("Flush")
    end

    it "returns a 'Straight'" do
      hand = [[9, :H], [8, :C], [7, :C], [6, :C], [5, :C]]
      expect(subject.categorise(hand)).to eq("Straight")
    end

    it "returns a 'High Card' and specifies which card is highest" do
      hand = [[2, :H], [4, :S], [8, :H], [:Q, :C], [:A, :D]]
      expect(subject.categorise(hand)).to eq("Your High Card is Ace")
    end
  end

end
