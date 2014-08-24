module Card
	# Errors for when you incorrectly use a card.
		class CardError < StandardError; end
	class Card
		# Legal arguments for Card#new.
			NUM = ['Ace', 'King', 'Queen', 'Jack', 'Joker'] + (2..10).to_a
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
end
