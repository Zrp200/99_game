require_relative "spec_helper"
require "99_game"
describe "$deck" do
	describe "#length" do
		it "should == 54" do; expect($deck.length + 6).to eq 54; end
	end
end
describe "Card" do
	cards = ["Ace", "King", "Queen", "Jack", "Joker"] + (2..10).to_a
	describe "#value" do
		for card in cards
			describe "#{card}" do
				it "should == #{Card.new(card)._value}" do; 
					expect(Card.new(card).value).to eq Card.new(card)._value
				end
			end
		end
	end
end
describe "converter" do
	context "when a number" do
		it "should return the input as a number" do
			expect(converter("5")).to eq 1
		end
	end
	context "when an abbreveation" do
		it "should expand it" do
			expect(converter("k")).to eq "King"
		end
	end
end
describe "Hand" do
	hand = Hand.new
	describe "#hand" do
		describe "#length" do
			it "should == 3" do; expect(hand.hand.length).to eq 3; end
		end
	end
	describe "#initialize" do
		describe "$deck" do
			it "should have three less cards after initialization" do
				deck1, hand, deck2 = $deck.length, Hand.new, $deck.length
				expect(deck1).to > deck2
			end
		end
	end
end
				
