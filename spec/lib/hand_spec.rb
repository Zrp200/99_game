require "spec_helper"
require "hand"
describe "CPU" do
  s = Hand.new Deck.new
  s.hand = [Card.new("King", Card::SPADES), Card.new("Joker"), Card.new(2, Card::DIAMONDS)]
  describe "test" do
    tests = proc {|index| test(s.hand[index], 50, nil)}
    v1 = tests.call 0
    v2 = tests.call 1
    v3 = tests.call 2
    describe v1 do
      it {is_expected.to be > v2}
      it {is_expected.to be > v3}
    end
  end
end
describe Hand do
	hand = Hand.new create_deck.call
	describe "#hand" do
		describe "#length" do
			subject { hand.hand.length }
			it {is_expected.to eq 3}
		end
	end
	describe "#new" do
		describe "Deck#length" do
			it "should have three less cards after initialization" do
				deck1, hand, deck2 = deck.cards.length, Hand.new( deck ), deck.cards.length
				expect( deck1 ).to be > deck2
			end
		end
	end
end
