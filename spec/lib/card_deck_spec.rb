require 'card_deck'
include CardDeck
describe Card do
	describe "::SPADES" do
		subject {Card::SPADES}
		it "should equal \u2660" {expect(subject).to eq "\u2660"}
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
    
