require_relative "99_game.rb"
class Hand # Creates an object that holds and can play cards. Interacts with Deck objects.
	def self.deck
		Deck.new.cards.shuffle!
	end
    	attr_accessor :hand # @return [Array<CardDeck::Card>]
    	

    	def initialize
		@hand = Array.new(3) {Hand.deck.shift}
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
		for index in @hand
			if index.num == card.num and not done
				discard = @hand[i]
				@hand.delete_at i
				@hand.push @deck.draw
				@deck.discard discard
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
        	@hand.each {|card| print "\t#{card.num}"}
    	end
    	alias inspect hand
end
