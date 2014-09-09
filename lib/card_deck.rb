# The gem
	module CardDeck
		# Errors for when you incorrectly use a card.
			class CardError < StandardError; end
		class Card
			# Legal arguments for parameter num in Card#new.
				NUM = %w(Ace King Queen Jack Joker) + (2..10).to_a
			# Legal arguments for parameter suit in Card#new
				SUIT = %w(Hearts Diamonds Spades Clubs)
			# The card's number. Must be Ace, 2, 3, 4, 5, 6, 7, 8, 9, 10, Jack, Queen, King, or Joker
				attr_accessor :num
			# The card's suit. Must be Spades, Diamonds, Clubs, Hearts, or nil.
				attr_accessor :suit
			# Creates a new card. Parameter num is the card's number. Parameter suit is the card's suit
				def initialize(num, suit=nil)
					unless NUM.include? num || SUIT.include? suit || suit.nil?
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
				# Creates a new Deck. Includes Jokers when jokers = true
					def initialize(jokers=false)
						@cards = Array.new
						for suit in Card::SUIT
							stock 'Ace', suit
							stock 'King', suit
							stock 'Queen', suit
							stock 'Jack', suit
							for num in (2..10).to_a
								stock num, suit
							end
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
