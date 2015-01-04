require_relative "card.rb"
class Hand # Creates an object that holds and can play cards. Interacts with Deck objects.
	@@deck = Deck.new.cards.shuffle!
    	attr_accessor :cards # @return [Array<CardDeck::Card>]
    	def initialize
		@cards = Array.new(3) {@@deck.shift}
	end
	
=begin
@param card [CardDeck::Card] the card played
@return [void]
@note Gameplay method
=end
	def play(card)
		if card.num == "King"
			$value = 99
		elsif card.num == "Joker"
			$value = 0
		else
			$value += card.value
		end
		i, done = 0, false
		for index in @cards
			if index.num == card.num and not done
				discard = @cards[i]
				@cards.delete_at i
				@cards.push @@deck.shift
				@@deck.push discard
				done = true
			end
			i += 1
		end
	end
		
=begin
@return [void]
Displays cards
=end
    	def view
		print "\tThese are your cards: "
        	@cards.each {|card| print "\t#{card.num}"}
    	end
    	alias inspect cards
end
