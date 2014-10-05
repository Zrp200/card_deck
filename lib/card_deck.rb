# The gem
	# Gem Version
		VERSION = "0.1.2"
	module CardDeck
		# Errors for when you incorrectly use a card.
			class CardError < StandardError; end
		class Card # The central part of any card game. It is what makes card games 'Card' games.
			# Suits
				HEARTS, SPADES, DIAMONDS = "\u2665", "\u2660", "\u2666"
			# Legal arguments for parameter num in Card#new.
				NUM = %w(Ace King Queen Jack Joker) + (2..10).to_a
			# Legal arguments for parameter suit in Card#new
				SUIT = %w(\u2665 \u2666 \u2660 Clubs)
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
		end
		# Card decks
			class Deck
				# The cards in the deck
					attr_accessor :cards
				# Creates a new Deck. Includes Jokers when parameter jokers = true
					def initialize(jokers=false)
						@cards = Array.new
						for suit in Card::SUIT
							stock 'Ace', suit
							for num in (2..10).to_a;  stock num, suit; end
							stock 'Jack', suit
							stock 'Queen', suit
							stock 'King', suit
						end
						2.times {stock 'Joker'} if jokers
					end
				private
					# Creates a Card to add to Deck#cards
						def stock(num, suit=nil)
							@cards.push Card.new(num, suit)
						end
			end
	end
