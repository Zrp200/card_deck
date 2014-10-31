# The gem
	module CardDeck
		# Gem Version
			VERSION = "1.0.1"
		# Errors for when you incorrectly use a card.
			class CardError < StandardError; end
		class Card # The central part of any card game. It is what makes card games 'Card' games.
			# Suits
				HEARTS, SPADES, DIAMONDS, CLUBS = "\u2665", "\u2660", "\u2666", "\u2663"
			# Legal arguments for parameter num in Card#new.
				NUM = %w(Ace King Queen Jack Joker) + (2..10).to_a
			# Legal arguments for parameter suit in Card#new
				SUIT = [HEARTS, SPADES, DIAMONDS, CLUBS]
			# The card's number. Must be Ace, 2, 3, 4, 5, 6, 7, 8, 9, 10, Jack, Queen, King, or Joker
				attr_accessor :num
			# The card's suit. Must be Spades, Diamonds, Clubs, Hearts, or nil.
				attr_accessor :suit
			# Creates a new card. Parameter num is the card's number. Parameter suit is the card's suit
				def initialize(num, suit=nil)
					unless NUM.include?(num) || SUIT.include?(suit) || suit.nil?
					raise CardError, 'Illegal argument'
					else
						@num, @suit = num, suit
					end
				end
			def self.gen # Creates a random new card.
				self.new NUM.sample, SUIT.sample
			end
			def abbreviation # The short version of the card
				unless @num == "Joker"
					if @num == 10 then "#{@suit}#{@num}"
					else
						"#{@suit}#{(@num.to_s)[0]}"
					end
				else
					@num
				end
			end
			alias abbr abbreviation # A shorter method name
			alias to_s abbr
			alias inspect abbr
		end
		# Card decks
			class Deck
				# The cards in the deck
					attr_accessor :cards
					alias inspect cards
				# Creates a new Deck. Includes Jokers when parmeter args == {jokers: true}
					def initialize(args=Hash.new(false))
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
					def stock(num, suit=nil) # Creates a Card to add to Deck#cards
						@cards.push Card.new num, suit
					end
			end
	end
