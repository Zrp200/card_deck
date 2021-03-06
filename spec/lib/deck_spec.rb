require "rspec/expectations"
require "card_deck/deck"
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
include CardDeck
RSpec.describe Deck do
	describe 'constructor' do
		subject {Deck()}
		it {is_expected.to be_instance_of Deck}
	end
	describe "#new" do
		subject {Deck.new}
		it {is_expected.to respond_to(:push, :sample, :include?)}
		it {is_expected.to_not have_jokers}
		context ":jokers == true" do
			subject {Deck.new jokers: true}
			it {is_expected.to have_jokers}
		end
	end
end
