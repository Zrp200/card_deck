require "card_deck"
include CardDeck
RSpec.describe Card do
	describe "#new" do
		subject {Card.gen}
		it {is_expected.to respond_to(:num, :suit, :to_s, :inspect, :abbr, :abbreviation)}
		its(:abbr) {is_expected.to eq(subject.abbreviation)}
		its(:to_s) {is_expected.to eq(subject.inspect)}
	end
	describe "::SPADES" do
		subject {Card::SPADES}
		it {is_expected.to eq("\u2660")}
	end
	describe "::CLUBS" do
		subject {Card::CLUBS}
		it {is_expected.to eq("\u2663")}
	end
	describe "::HEARTS" do
		subject {Card::HEARTS}
		it {is_expected.to eq("\u2665")}
	end
	describe "::DIAMONDS" do
		subject {Card::DIAMONDS}
		it {is_expected.to eq("\u2666")}
	end
	describe "::SUIT" do
		subject {Card::SUIT}
		it {is_expected.to include Card::DIAMONDS, Card::HEARTS, Card::SPADES, Card::CLUBS}
	end
end

    
