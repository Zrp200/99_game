require "card_deck"
# Used by the CPU to determine which card to play. Parameter card needs to be an instance of Card.
	def test(card, actual_value, test_value)
        	if card.num == "King"
			test_value = 99
        	elsif card.num == "Joker"
        		test_value = 0
        	else; test_value = actual_value + card.value
	    	end
	    	test_value = -100 if test_value > 99
		return test_value
    	end
# Tests if obj is not nil.
	def not_nil?(obj)
		if obj.nil?
			return false
		else
			return true
		end
	end
# Converts input to an integer if String#capitalize does something. If parameter input is an abbreviation, _input_ is converted to what it stands for. Otherwise, it simply returns a capitalized version of _input_. If _input_ is nil or an emtpy string, raises a CardError
	def converter(input)
		abbrev = {"$" => "Joker", "K" => "King", "J" => "Jack", "Q" => "Queen", "A" => "Ace"}
		raise(CardError, "Input cannot be blank") if input == String.new
		if input.to_i == 0
			case input.capitalize
				when "$" then "Joker"
				when "K" then "King"
				when "J" then "Jack"
				when "Q" then "Queen"
				when "A" then "Ace"
			end
		else
			input.to_i
		end
	end
# Expected errors
	class CardError < Exception; end
class CardDeck::Card # Represents a card in the deck
	# Backup method for Card#value
		def value
			return case @num
				when "Ace" then 1
				when 2..3 then @num
				when 4 then 0
				when 5..8 then @num
				when 9 then 0
				when 10 then 10
				when "Jack" then 0
				when "Queen" then -10
				when "King" then 99
				when "Joker" then 0
			end
		end
end
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
# Combines sleep and a newline. 'p' is the amount of time waited.
	def pause(p)
    	sleep p
    	puts
	end
class CardDeck::Deck # Cards are stored in these objects
	# Draw from the deck
		def draw; @cards.shift; end
	# Adds 'card' to the deck. Used with Hand#play.
		def discard(card); @cards.push card; end
end

