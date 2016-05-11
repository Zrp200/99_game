autoload :CardDeck, "card_deck"
autoload :Card, "card"
autoload :Hand, "hand"
=begin
@param card [CardDeck::Card]
@param actual_value [Integer]
@return [Integer]
@note Used by the CPU to determine which card to play. Parameter card needs to be an instance of Card.
=end
	def card_test(card, actual_value)
		test_value = case card.num
			when "King" then 99
        		when "Joker" then 0
        	else
			actual_value + card.value
	    	end
	    	test_value = -1 if test_value > 99
		test_value
    	end
# Tests if obj is not nil.
	def not_nil?(obj)
		!obj.nil?
	end
# Converts input to an integer if String#capitalize does something. If parameter input is an abbreviation, _input_ is converted to what it stands for. Otherwise, it simply returns a capitalized version of _input_. If _input_ is nil or an emtpy string, raises a CardError
# Expected errors
class CardError < Exception; end
=begin
Combines sleep and a newline
@param p [Integer] amount of time to sleep
@return [void]
=end
def pause(p)
    	sleep p
    	puts
end
=begin
@param input [String]
@return [String, Integer]
If parameter input is an abbreviation, input is converted to what it stands for.
Otherwise, it simply returns a capitalized version of input.
@raise [CardError] if input is nil or an emtpy string
=end
def converter(input)
	abbrev = {"$" => "Joker", "K" => "King", "J" => "Jack", "Q" => "Queen", "A" => "Ace"}
	raise(CardError, "Input cannot be blank") if input == String.new
	if input.to_i.zero?
		case input.capitalize
			when ?$, "Joker" then "Joker"
			when ?K, "King" then "King"
			when ?J, "Jack" then "Jack"
			when ?Q, "Queen" then "Queen"
			when ?A, "Ace" then "Ace"
		end
	else
		input.to_i
	end
end

