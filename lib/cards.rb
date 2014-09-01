# The gem
	module CardDeck
		# Errors for when you incorrectly use a card.
			class CardError < StandardError; end
		class Card
			# Legal arguments for Card#new.
				NUM = %w(Ace King Queen Jack Joker) + (2..10).to_a
			# The card's number. Must be Ace, 2, 3, 4, 5, 6, 7, 8, 9, 10, Jack, Queen, King, or Joker
				attr_accessor :num
			# Creates a new card. Parameter num is the card's number.
				def initialize(num)
					unless NUM.include? num
					raise CardError, 'Illegal argument for parameter num'
					else
						@num = num
					end
				end
		end
		# Card decks
			class Deck
				# The cards in the deck
					attr_accessor :cards
				# Creates a new Deck. Includes Jokers when jokers = true
					def initialize(jokers=false)
						4.times do
							stock 'Ace'
							stock 'King'
							stock 'Queen'
							stock 'Jack'
							for num in (2..10).to_a
								stock num
							end
						end
						2.times {stock 'Joker'} if jokers
					end
				private
					# Creates a Card to add to Deck#cards
						def stock(num)
							@cards.push Card.new(num)
						end
			end
	end
