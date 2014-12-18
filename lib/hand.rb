require_relative "deck.rb"
class Hand # Creates an object that holds and can play cards. Interacts with Deck objects.
	# The actual hand
    	attr_accessor :hand
	# Creates a new Hand. The deck argument tells the object which deck to use in Hand#play
    	def initialize(deck_in_use)
			@hand, @deck = [deck_in_use.draw, deck_in_use.draw, deck_in_use.draw], deck_in_use
		end
	# Gameplay method. The parameter 'card' is the card being played.
    	def play(card)
			if card.num == "King"; $value = 99
			elsif card.num == "Joker"; $value = 0
			else; $value += card.value
			end
			i, done = 0, false
			for index in @hand
				if index.num == card.num and not done
					discard = @hand[ i ]
					@hand.delete_at i
					@hand.push @deck.draw
					@deck.discard discard
					done = true
				end
				i += 1
			end
		end
	# Allows you to see your cards.
    	def view
		print "\tThese are your cards: "
        	@hand.each {|card| print "\t#{card.num}"}
    	end
    	alias inspect hand
end
