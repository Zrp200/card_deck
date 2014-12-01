require "rspec/expectations"
require "spec_helper"
RSpec::Matchers.define :have_jokers do
	match do |actual|
		jokers = false
		for card in actual
			jokers = true if card.num == "Joker"
		end
		return jokers
	end
end
RSpec.describe Deck do
	describe "#new" do
		subject {Deck.new}
		it {is_expected.to respond_to(:cards, :inspect)}
		describe "cards" do
			subject {Deck.new.cards}
			it {is_expected.to_not have_jokers}
			describe "sample" do
				subject {Deck.new.cards.sample}
				its(:suit) {is_expected.to_not be nil}
			end
		end
		context ":jokers == true" do
			subject {Deck.new jokers: true}
			its(:cards) {is_expected.to have_jokers}
		end
		
	end
end
