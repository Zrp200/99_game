require "card_deck"
class CardDeck::Card # Represents a card in the deck
	# Value of the card
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
