require "spec_helper"
require "hand"
describe "CPU" do
  s = Hand.new
  s.cards = [Card.new("King", Card::SPADES), Card.new("Joker"), Card.new(2, Card::DIAMONDS)]
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
	its(:deck) {is_expected.to be_instance_of Array}
	describe "#new" do
		describe "#cards" do
			subject {Hand.new.cards}
			its(:length) {is_expected.to eq 3}
		end
	end
end
