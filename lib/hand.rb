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
# @return [Array<Integer>]
# @note Used by the CPU to determine which card to play. Parameter card needs to be an instance of Card.
	def test_outcomes
		outcomes = Array.new
		@cards.each do |card| 
			test_value = case card.num
			when "King"
				if (@cards - [card]).any? {|card| [4, 9, "Jack", "Queen", "King"].include? card.num} || rand < 0.1 
					99
				else 0.5
				end
        		when "Joker" then 0
        		else
				$value + card.value
	    		end
	    		test_value = -1 if test_value > 99
			outcomes << test_value
		end
		return outcomes
    	end
end
