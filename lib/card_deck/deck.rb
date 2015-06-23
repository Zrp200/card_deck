require_relative "card.rb"
module CardDeck
	class Deck # The deck
		attr_accessor :cards # @return [Array<Card>]
		def initialize(args=Hash.new(false)) # Creates a new Deck. Includes Jokers when parmeter args == {jokers: true}
			@cards = Array.new
			for suit in Card::Suit
				stock 'Ace', suit
				for num in (2..10).to_a; stock num, suit; end
				stock 'Jack', suit
				stock 'Queen', suit
				stock 'King', suit
			end
			2.times {stock 'Joker'} if args[:jokers]
		end
		private
			def stock(num, suit=Card::Suit.sample) # Creates a Card to add to Deck#cards
				@cards.push Card.new num, suit
			end
	end
end
