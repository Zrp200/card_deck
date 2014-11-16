# The gem
	module CardDeck
		def Card(num, suit=nil) # an easier way to generate a card
			Card.new num, suit
		end
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
					unless suit.nil?
						suit = case suit.downcase
							when "diamonds" then DIAMONDS
							when "spades" then SPADES
							when "hearts" then HEARTS
							when "clubs" then CLUBS
						end
					end
					unless NUM.include?(num) || SUIT.include?(suit) || suit.nil?
					raise CardError, 'Illegal argument'
					else
						@num, @suit = num, suit
					end
				end
			def self.gen # Creates a random new card.
				self.new NUM.sample, SUIT.sample
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
			alias abbr abbreviation # A shorter method name
			alias to_s abbr
			alias inspect abbr
		end
	end