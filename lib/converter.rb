def converter(input) # Converts input to an integer if String#capitalize does something. If parameter input is an abbreviation, _input_ is converted to what it stands for. Otherwise, it simply returns a capitalized version of _input_. If _input_ is nil or an emtpy string, raises a CardError
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