require 'card_deck'
include CardDeck
describe Card do
    describe "#abbr" do
	context "@suit = SPADES and 3" do
		subject {Card.new 3, Card::SPADES}
		it "should return #{Card::SPADES}3" do
			expect(subject.abbr).to eq "#{Card::SPADES}3"
		end
	end
    end
end
    
