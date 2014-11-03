require "rspec/expectations"
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
		deck = Deck.new
		subject {deck}
		it {is_expected.to respond_to(:cards, :inspect)}
		describe deck.cards do
			it {is_expected.to eq(deck.inspect)}
			it {is_expected.to_not have_jokers}
		end
		context ":jokers == true" do
			subject {Deck.new jokers: true}
			its(:cards) {is_expected.to have_jokers}
		end
	end
end
