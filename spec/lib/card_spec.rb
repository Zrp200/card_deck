require "spec_helper"
include CardDeck
RSpec.describe Card do
	describe "#new" do
		subject {Card.gen}
		it {is_expected.to respond_to(:num, :suit, :to_s, :inspect, :abbr, :abbreviation)}
		its(:suit) {is_expected.to_not be nil}
		its(:abbr) {is_expected.to eq(subject.abbreviation)}
		its(:to_s) {is_expected.to eq(subject.inspect)}
		suit_check = proc {|suit| Card.new Card::NUM.sample, suit}
		context "when suit == diamonds" do
			subject {suit_check.call("diamonds").suit}
			it {is_expected.to eq Card::DIAMONDS}
		end
		context "when suit == spades" do
			subject {suit_check.call("spades").suit}
			it {is_expected.to eq Card::SPADES}
		end
		context "when suit == hearts" do
			subject {suit_check.call("hearts").suit}
			it {is_expected.to eq Card::HEARTS}
		end
		context "when suit == clubs" do
			subject {suit_check.call("clubs").suit}
			it {is_expected.to eq Card::CLUBS}
		end
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

    
