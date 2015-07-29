module CardDeck # The gem

=begin
An easier way to generate a card
@param num [String, Fixnum]
@param suit [String]
@see Card#initialize
@return [Card]
=end
	def Card(num=Card::Num.sample, suit=Card::Suit.sample)
		Card.new num, suit
	end
	class CardError < StandardError; end # Errors for when you incorrectly use a card.
	class Card # The central part of any card game. It is what makes card games 'Card' games.
		Hearts, Spades, Diamonds, Clubs = "\u2665", "\u2660", "\u2666", "\u2663" # Suits
		Num = %w(Ace King Queen Jack Joker) + (2..10).to_a # Legal arguments for parameter num in Card#new.
		Suit = [Hearts, Spades, Diamonds, Clubs] # Legal arguments for parameter suit in Card#new
		attr_accessor :num # @return [String, Fixnum] must be Ace, 2, 3, 4, 5, 6, 7, 8, 9, 10, Jack, Queen, King, or Joker
		attr_accessor :suit # @return [String] must be spades, diamonds, clubs, or hearts

=begin
@param suit [String] 
@param num [String, Fixnum]
=end
		def initialize(num=Num.sample, suit=Suit.sample)
			suit = const_get suit.upcase unless Suit.include? suit
			@num, @suit = num, suit
		end

=begin
The shorter representation of the card
@return [String]
=end
		def abbreviation
			unless @num == "Joker"
				if @num == 10 then @suit + @num
				else @suit + @num.to_s.fetch(0) end
			else @num end
		end
		def black? # @return [Boolean]
			suit == Spades | Clubs
		end
		def red?; suit == Hearts | Diamonds; end # @return [Boolean]
		alias abbr abbreviation
		alias to_s abbr
		alias inspect abbreviation
	end
end
