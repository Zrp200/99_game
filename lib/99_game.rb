# Tests if obj is not nil.
def not_nil?(obj)
	if obj.nil
		return false
	else
		return true
	end
end
# Converts _input_ to an integer if String#capitalize does something. If _input_ is an abbreviation, _input_ is converted to what it stands for. Otherwise, it simply returns a capitalized version of _input_. If _input_ is nil or an emtpy string, raises a CardError
def converter(input)
	abbrev = {"$".to_sym => "Joker", K: "King", J: "Jack", Q: "Queen", A: "Ace"}
	if input == input.capitalize
		return input.to_i
	elsif not_nil? abbrev[input.capitalize.to_sym]
		return abbrev[input.capitalize.to_sym]
	elsif input.nil || input == String.new
		raise CardError, "Input not allowed"
	else
		return input.capitalize
	end
end
class CardError < Exception; end
class Card # Represents a card in the deck
	attr_reader :num
	@@value = {"Ace" => 1, 4 => 0, 9 => 0, "Jack" => 0, "Joker" => 0, "King" => 99, "Queen" => -10}
# Gives the Card's value
	def value
		@@value.default = @num.to_i
		return @@value[@num]
	end
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
# Creates a new card
    def initialize(card); @num = card; end
end
class Hand # Creates an object that holds and can play cards
    attr_reader :hand
# Creates a new Hand
    def initialize; @hand = [$deck.shift, $deck.shift, $deck.shift]; end
# Gameplay method
    def play(card)
		if card.num == "King"; $value = 99
		elsif card.num == "Joker"; $value = 0
		else; $value += card.value
		end
		i, done = 0, false
		for index in @hand
			if index.num == card.num and not done
				discard = @hand[i]
				@hand.delete_at(i)
				draw = $deck.shift
				@hand.push(draw)
				$deck.push(discard)
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
# Combines sleep and a newline.
def pause(p)
    sleep p
    puts
end
$deck = Array.new
4.times do # Add the cards to the deck
	$deck << Card.new "Ace"
	$deck << Card.new "King"
	$deck << Card.new "Queen"
	$deck << Card.new "Jack"
	$deck << Card.new 10
	$deck << Card.new 9
	$deck << Card.new 8
	$deck << Card.new 7
	$deck << Card.new 6
	$deck << Card.new 5  
	$deck << Card.new 4  
	$deck << Card.new 3
	$deck << Card.new 2
end
2.times {$deck << Card.new "Joker"}
$deck.shuffle!
__END__
