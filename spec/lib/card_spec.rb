require "spec_helper"
require "card_deck/card"
include CardDeck
RSpec.describe Card do
	describe "#new" do
		subject {Card.new}
		it {is_expected.to respond_to(:num, :suit, :to_s, :abbr, :abbreviation, :black? , :red? )}
		its(:suit) {is_expected.to_not be nil}
		its(:abbr) {is_expected.to eq(subject.abbreviation)}
		its(:to_s) {is_expected.to eq(subject.abbr)}
		describe "parameter suit" do
			suit_check = proc {|suit| Card.new Card::Num.sample, suit}
			subject {Card.new.suit}
			it {is_expected.to_not be nil}
			%w(diamonds hearts).each do |suit|
				context "when #{suit}" do
					subject {suit_check.call(suit)}
					it {is_expected.to be_red}
				end
			end
			%w(spades clubs).each do |suit|
				context "when #{suit}" do
					subject {suit_check.call(suit)}
					it {is_expected.to be_black}
				end
			end
		end
	end
	describe "::Spades" do
		subject {Card::Spades}
		it {is_expected.to eq("\u2660")}
	end
	describe "::Clubs" do
		subject {Card::Clubs}
		it {is_expected.to eq("\u2663")}
	end
	describe "::Hearts" do
		subject {Card::Hearts}
		it {is_expected.to eq("\u2665")}
	end
	describe "::Diamonds" do
		subject {Card::Diamonds}
		it {is_expected.to eq("\u2666")}
	end
	describe "::Suit" do
		subject {Card::Suit}
		it {is_expected.to include Card::Diamonds, Card::Hearts, Card::Spades, Card::Clubs}
	end
end

    
