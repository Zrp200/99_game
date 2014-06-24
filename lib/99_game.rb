class CardError < Exception; end
class Card # Represents a card in the deck
	attr_reader :num
	@@value = {"Ace" => 1, 4 => 0, 9 => 0, "Jack" => 0, "Joker" => 0, "King" => 99, "Queen" => -10}
	def value
		@@value.default = @num.to_i
		return @@value[@num]
	end
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
    def initialize(card); @num = card; end
end
class UserCard < Card # This class converts user input into a Card-like object
	attr_reader :num
	@@num = {King: "King", K: "King", Ace: "Ace", A: "Ace", Queen: "Queen", Q: "Queen", Jack: "Jack", J: "Jack", Joker: "Joker", "$".to_sym => "Joker"}
	def _num; @@num; end
	def initialize(number=""); @@num.default, @num = number.to_i, @@num[number.capitalize.to_sym]; end
end
class Hand # Creates a object that holds and can play cards
    attr_reader :hand
    def initialize; @hand = [$deck.shift, $deck.shift, $deck.shift]; end
    def play(card)
		legal = false
		for cards in @hand; legal = true if cards.num == card.num; end
		raise CardError, "\aCard not allowed\a" unless legal
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
    def view
		print "\tThese are your cards: "
        @hand.each {|card| print "\t#{card.num}"}
    end
end
def pause(p)
    sleep(p)
    puts
end
$deck = Array.new
4.times do # Add the cards to the deck
	$deck.push(Card.new("Ace"))
	$deck.push(Card.new("King"))
	$deck.push(Card.new("Queen"))
	$deck.push(Card.new("Jack"))
	$deck.push(Card.new(10))
	$deck.push(Card.new(9))
	$deck.push(Card.new(8))
	$deck.push(Card.new(7))
	$deck.push(Card.new(6))
	$deck.push(Card.new(5))
	$deck.push(Card.new(4))
	$deck.push(Card.new(3))
	$deck.push(Card.new(2))
end
2.times {$deck.push(Card.new("Joker"))}
$deck.shuffle!
__END__