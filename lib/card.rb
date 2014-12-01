module CardDeck # The gem
	def Card(num, suit); Card.new num, suit; end # an easier way to generate a card
	class CardError < StandardError; end # Errors for when you incorrectly use a card.
	class Card # The central part of any card game. It is what makes card games 'Card' games.
		HEARTS, SPADES, DIAMONDS, CLUBS = "\u2665", "\u2660", "\u2666", "\u2663" # Suits
		NUM = %w(Ace King Queen Jack Joker) + (2..10).to_a # Legal arguments for parameter num in Card#new.
		SUIT = [HEARTS, SPADES, DIAMONDS, CLUBS] # Legal arguments for parameter suit in Card#new
		attr_accessor :num # The card's number. Must be Ace, 2, 3, 4, 5, 6, 7, 8, 9, 10, Jack, Queen, King, or Joker
		attr_accessor :suit # The card's suit. Must be Spades, Diamonds, Clubs, or Hearts.
		def initialize(num, suit) # Creates a new card. Parameter num is the card's number. Parameter suit is the card's suit
			unless SUIT.include? suit
				suit = case suit.downcase
					when "diamonds" then DIAMONDS
					when "spades" then SPADES
					when "hearts" then HEARTS
					when "clubs" then CLUBS
				end
			end
			@num, @suit = num, suit
		end
		def self.gen; self.new NUM.sample, SUIT.sample; end # Creates a random new card.
		def abbreviation # The shorter representation of the card
			unless @num == "Joker"
				if @num == 10 then "#{@suit}#{@num}"
				else
					"#{@suit}#{(@num.to_s)[0]}"
				end
			else
				@num
			end
		end
		def black?; suit == SPADES || suit == CLUBS; end # Tests if the suit color is black
		alias abbr abbreviation # A shorter method name
		alias to_s abbr
	end
end
