require 'card_deck'
include CardDeck
describe Card do
	describe "::SPADES" do
		subject {Card::SPADES}
		it "should equal \u2660" do
			expect(subject).to eq "\u2660"
		end
	end
	describe "::CLUBS" do
		subject {Card::CLUBS}
		it "should equal \u2663" do
			expect(subject).to eq "\u2663"
		end
	end
    describe "#abbr" do
		context "@suit = SPADES and 3" do
			subject {Card.new 3, Card::SPADES}
			it "should return #{Card::SPADES}3" do
				expect(subject.abbr).to eq "#{Card::SPADES}3"
			end
		end
    end
end
    
