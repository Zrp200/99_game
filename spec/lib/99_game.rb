deck = Deck.new
describe Deck do
	subject {Deck.new}
	describe "#length" do
		it "should == 54" do; expect(subject.cards.length).to eq 54; end
	end
end
describe Card do
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
describe Hand do
	hand = Hand.new Deck.new
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
