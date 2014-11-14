require "spec_helper"
create_deck = proc {Deck.new jokers: true}
deck = create_deck.call
describe Deck do
	describe create_deck.call.cards.length do
		it {is_expected.to eq(54)}
	end
end
describe "converter" do
	context "when a number" do
		it "should return the input as a number" do
			expect(converter("5")).to eq 5
		end
	end
	context "when an abbreveation" do
		it "should expand it" do
			expect(converter("K")).to eq "King"
		end
	end
end
describe Hand do
	hand = Hand.new create_deck.call
	describe "#hand" do
		describe "#length" do
			subject { hand.hand.length }
			it "should == 3" do; expect( subject ).to eq 3; end
		end
	end
	describe "#initialize" do
		describe "Deck#length" do
			it "should have three less cards after initialization" do
				deck1, hand, deck2 = deck.cards.length, Hand.new( deck ), deck.cards.length
				expect( deck1 ).to be > deck2
			end
		end
	end
end
