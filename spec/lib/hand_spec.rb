require "spec_helper"
require "hand"
describe "CPU" do
  s = Hand.new
  s.cards = [Card.new(10, Card::Spades), Card.new("Joker"), Card.new(2, Card::Diamonds)]
  describe "test" do
    $value = 50
    describe s.test_outcomes[0] do
      it {is_expected.to be > s.test_outcomes[1]}
      it {is_expected.to be > s.test_outcomes[2]}
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
