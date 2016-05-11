require_relative "card.rb"
$deck = Deck.new(jokers: true).cards.shuffle!
class Hand # Creates an object that holds and can play cards. Interacts with Deck objects.
	@@deck = Deck.new.cards.shuffle!
    	attr_accessor :cards # @return [Array<CardDeck::Card>]
    	def initialize
		@cards = Array.new(3) {$deck.shift}
	end
	
# @param card [CardDeck::Card] the card played
# @return [void]
# @note Gameplay method
	def play(card)
		raise "Card not found" unless @cards.include? card 
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
				@cards.push $deck.shift
				$deck.push discard
				done = true
				$deck.shuffle!
			end
			i += 1
		end
		card
	end
		
# @return [void]
# Displays cards
    	def view_cards
		print "These are your cards:  "
        	@cards.each {|card| print "#{card}  "}
    	end
    	alias inspect cards
end
