# Used by the CPU to determine which card to play. Argument card needs to be an instance of Card 
	def test(card, actual_value, test_value)
        	if card.num == "King"
        		value = 99
        	elsif card.num == "Joker"
        		value = -1
        	else; value = $value + card.value
	    	end
	    	value = -100 if value > 99
    	end
# Tests if obj is not nil.
	def not_nil?(obj)
		if obj.nil?
			return false
		else
			return true
		end
	end
# Converts input to an integer if String#capitalize does something. If _input_ is an abbreviation, _input_ is converted to what it stands for. Otherwise, it simply returns a capitalized version of _input_. If _input_ is nil or an emtpy string, raises a CardError
	def converter(input)
		abbrev = {"$" => "Joker", "K" => "King", "J" => "Jack", "Q" => "Queen", "A" => "Ace"}
		if input == input.capitalize
			return input.to_i
		elsif not_nil? abbrev[ input ]
			return abbrev[ input ]
		elsif input.nil? || input == String.new
			raise CardError, "Input not allowed"
		else
			return input
		end
	end
# Expected errors
	class CardError < Exception; end
class Card # Represents a card in the deck
	# Gives the number on the card
		attr_reader :num
	# Gives the Card's value
		attr_reader :value
	# Backup method for Card#value
		def _value
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
	# Creates a new card with num as the attribute :num
		def initialize(num)
			@num, @value = num, case num
				when "Ace" then 1
				when 4 then 0
				when 9 then 0
				when "Jack" then 0
				when "Joker" then 0
				when "King" then 99
				when  "Queen" then -10
			else
				num.to_i
			end
		end
end
class Hand # Creates an object that holds and can play cards. Interacts with Deck objects.
	# The actual hand
    	attr_reader :hand
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
end
# Combines sleep and a newline. 'p' is the amount of time waited.
	def pause(p)
    	sleep p
    	puts
	end
class Deck # Cards are stored in these objects
	# The contents of the deck
		attr_reader :cards
	def initialize # Creates a new deck that can now be used for playing the game
		@cards = Array.new
		4.times do # Add the cards to the deck
			@cards.push Card.new("Ace")
			@cards.push Card.new("King")
			@cards.push Card.new("Queen")
			@cards.push Card.new("Jack")
			@cards.push Card.new(10)
			@cards.push Card.new(9)
			@cards.push Card.new(8)
			@cards.push Card.new(7)
			@cards.push Card.new(6)
			@cards.push Card.new(5) 
			@cards.push Card.new(4) 
			@cards.push Card.new(3)
			@cards.push Card.new(2)
		end
		2.times {@cards.push Card.new("Joker")}
		@cards.shuffle!
	end
	# Draw from the deck
		def draw; @cards.shift; end
	# Adds 'card' to the deck. Used with Hand#play.
		def discard(card); @cards.push card; end
end

