require 'card_deck'
include CardDeck
RSpec.describe Card::SPADES do
	it {is_expected.to eq("\2660")}
end
RSpec.describe Card do
	it "is expected to respond to :num, :suit" do
		expect( Card.new((Card::NUM - ["Joker"]).sample, Card::SUIT.sample)).to respond_to(:num, :suit)
	end
	describe "::CLUBS" do
		subject {Card::CLUBS}
		it "should equal \u2663" do
			expect(subject).to eq "\u2663"
		end
	end
	describe "#abbr" do
		for suit in Card::SUIT
			for num in (Card::NUM - ["Joker"])
				context "@num, @suit = #{num}, #{suit}" do
					subject = Card.new num, suit
					case String(subject.num).length
						when 1
							it "should return #{subject.suit}#{subject.num}" do
								expect(subject.abbr).to eq "#{subject.suit}#{subject.num}"
							end
						when 2
							it "should return #{subject.suit}#{subject.num}" do
								expect(subject.abbr).to eq "#{subject.suit}#{subject.num}"
							end
					else
						it "should return #{subject.suit}#{(subject.num)[0]}" do
							expect(subject.abbr).to eq "#{subject.suit}#{(subject.num.to_s)[0]}"
						end
					end
				end
			end
		end
		context "@num = \"Joker\"" do
			subject = Card.new "Joker"
			it "should return \"Joker\"" do
				expect(subject.abbr).to eq "#{subject.num}"
			end
		end
	end
end
    
