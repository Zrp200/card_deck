RSpec.describe Deck do
	describe "#new" do
		subject {Deck.new}
		it {is_expected.to respond_to(:cards, :inspect)}
		its(:cards) {is_expected.to eq(subject.inspect)}
		context ":jokers == true" do
			subject {Deck.new jokers: true}
			describe subject.cards do
				its(:length) {is_expected.to eq 54}
			end
		end
	end
end
