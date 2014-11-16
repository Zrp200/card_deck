require_relative "card.rb"
include CardDeck
class Deck # The deck
	# The cards in the deck
		attr_accessor :cards
		alias inspect cards
	def initialize(args=Hash.new(false)) # Creates a new Deck. Includes Jokers when parmeter args == {jokers: true}
		@cards = Array.new
		for suit in Card::SUIT
			stock 'Ace', suit
			for num in (2..10).to_a;  stock num, suit; end
			stock 'Jack', suit
			stock 'Queen', suit
			stock 'King', suit
		end
		2.times {stock 'Joker'} if args[:jokers]
	end
	private
		def stock(num, suit=nil); @cards.push Card.new num, suit; end # Creates a Card to add to Deck#cards
end
