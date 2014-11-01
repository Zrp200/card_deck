include CardDeck
jokercheck = proc do
	jokers = false
	for card in subject
		jokers = true if card.num == "Joker"
	end
	return jokers
end
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
RSpec.describe Deck do
	describe "#new" do
		subject {Deck.new}
		it {is_expected.to respond_to(:cards, :inspect)}
		its(:cards) {is_expected.to eq(subject.inspect)}
		its(:cards) {is_expected.to_not satisfy jokercheck.call(self)}
		context ":jokers == true" do
			subject {Deck.new jokers: true}
			its(:cards) {is_expected.to satisfy jokercheck.call(self)}
		end
	end
end

    
