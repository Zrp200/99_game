require "spec_helper.rb"
require "99_game"
create_deck = proc {Deck.new jokers: true}
deck = create_deck.call
describe Deck do
	describe create_deck.call.cards.length do
		it {is_expected.to eq 54}
	end
end
