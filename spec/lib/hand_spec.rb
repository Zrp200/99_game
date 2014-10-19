describe "CPU" do
  s = Hand.new Deck.new
  s.hand = [Card.new("King", Card::SPADES), Card.new("Joker"), Card.new(2, Card::DIAMONDS)]
  describe "test" do
    tests = proc {|index| test(s.hand[index], 50, nil)}
    v1 = tests.call 0
    v2 = tests.call 1
    v3 = tests.call 2
    describe v1 do
      it {is_expected.to be > v2}
      it {is_expected.to be > v3}
    end
  end
end
