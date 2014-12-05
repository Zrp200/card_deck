module CardDeck # The gem
	def Card(num=Card::Num, suit=Card::Suit.sample); Card.new num, suit; end # an easier way to generate a card
	class CardError < StandardError; end # Errors for when you incorrectly use a card.
	class Card # The central part of any card game. It is what makes card games 'Card' games.
		Hearts, Spades, Diamonds, Clubs = "\u2665", "\u2660", "\u2666", "\u2663" # Suits
		Num = %w(Ace King Queen Jack Joker) + (2..10).to_a # Legal arguments for parameter num in Card#new.
		Suit = [Hearts, Spades, Diamonds, Clubs] # Legal arguments for parameter suit in Card#new
		attr_accessor :num # The card's number. Must be Ace, 2, 3, 4, 5, 6, 7, 8, 9, 10, Jack, Queen, King, or Joker
		attr_accessor :suit # The card's suit. Must be Spades, Diamonds, Clubs, or Hearts.
		def initialize(num=Num.sample, suit=Suit.sample) # Creates a new card. Parameter num is the card's number. Parameter suit is the card's suit. When given no arguments, the num and suit are randomly generated
			unless Suit.include? suit
				suit = case suit.downcase
					when "diamonds" then Diamonds
					when "spades" then Spades
					when "hearts" then Hearts
					when "clubs" then Clubs
				end
			end
			@num, @suit = num, suit
		end
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
		def black?; suit == Spades || suit == Clubs; end # Tests if the suit color is black
		def red?; suit == Hearts || suit == Diamonds; end # Tests if the suit color is red
		alias abbr abbreviation # A shorter method name
		alias to_s abbr
		alias inspect abbreviation
	end
end
