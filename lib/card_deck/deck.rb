require "card_deck/card"
module CardDeck
	def Deck(args=Hash.new(false))
		Deck.new args
	end
	class Deck < SimpleDelegator # The deck
		def initialize(args=Hash.new(false)) # Creates a new Deck. Includes Jokers when parameter args == {jokers: true}
			super(Array.new)
			Card::Suit.each do |suit|
				push Card.new('Ace', suit)
				(2..10).each {|num| push Card.new(num, suit)}
				push Card.new('Jack', suit)
				push Card.new('Queen', suit)
				push Card.new('King', suit)
			end
			2.times {push Card.new('Joker')} if args[:jokers]
		end
	end
end
