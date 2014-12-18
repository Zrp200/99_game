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
