require "spec_helper"
require "hand"
describe "CPU" do
  s = Hand.new
  s.cards = [Card.new("King", Card::Spades), Card.new("Joker"), Card.new(2, Card::Diamonds)]
  describe "test" do
    tests = proc {|index| test(s.cards[index], 50, nil)}
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
	describe "#new" do
		describe "#cards" do
			subject {Hand.new.cards}
			describe "#length" do
				subject {Hand.new.cards.length}
				it {is_expected.to be 3}
			end
		end
	end
end
