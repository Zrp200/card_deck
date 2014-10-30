include CardDeck
RSpec.describe Card do
	describe "#new" do
		subject {Card.gen}
		its(:inspect) {is_expected.to eq(subject.abbr)}
		it {is_expected.to respond_to(:num, :suit)}
	end
	describe "::SPADES" do
		subject {Card::SPADES}
		it {is_expected.to eq("\u2660")}
	end
	describe "::CLUBS" do
		subject {Card::CLUBS}
		it "should equal \u2663" do
			expect(subject).to eq "\u2663"
		end
	end
end
    
