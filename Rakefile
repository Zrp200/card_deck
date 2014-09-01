namespace 'build' do
	task '000'.to_sym do
		`gem build card_deck.gemspec`
		`git add card_deck-0.0.0.gem`
		`git commit card_deck-0.0.0.gem -m Built_0.0.0_gem`
		`git push`
	end
end
