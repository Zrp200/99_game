describe "CPU" do
  subject{ Hand.new Deck.new}
  subject.hand.hand = [Card.new("King", Card::SPADES), Card.new("Joker")]
end
