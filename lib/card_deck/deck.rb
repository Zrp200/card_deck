require "card_deck/card"
module CardDeck
	def Deck(args=Hash.new(false))
		Deck.new args
	end
	class Deck # The deck
		attr_accessor :cards # @return [Array<Card>]
		def initialize(args=Hash.new(false)) # Creates a new Deck. Includes Jokers when parmeter args == {jokers: true}
			@cards = Array.new
			Card::Suit.each do |suit|
				stock 'Ace', suit
				(2..10).each {|num| stock num, suit}
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
