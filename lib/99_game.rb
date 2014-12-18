require "card_deck"
require_relative "card.rb"
require_relative "deck.rb"
require_relative "hand.rb"
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
# Expected errors
class CardError < Exception; end
# Combines sleep and a newline. 'p' is the amount of time waited.
	def pause(p)
    	sleep p
    	puts
	end

