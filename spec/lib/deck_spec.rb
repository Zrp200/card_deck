require "rspec/expectations"
<<<<<<< HEAD
=======
require "deck"
require "spec_helper"
>>>>>>> aa432f55ce80fa02878a556a7566c13aa3d6f93f
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
		its(:cards) {is_expected.to_not have_jokers}
		context ":jokers == true" do
			subject {Deck.new jokers: true}
			its(:cards) {is_expected.to have_jokers}
		end
	end
end