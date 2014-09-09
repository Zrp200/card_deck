namespace 'build' do
	task '000'.to_sym do
		`gem build card_deck.gemspec`
		`git add card_deck-0.0.0.gem`
		`git commit card_deck-0.0.0.gem -m Built_0.0.0_gem`
		`git push`
	end
	task '010'.to_sym do
		`git pull`
		`gem build card_deck.gemspec`
		`git add card_deck-0.1.0.gem && git commit card_deck-0.1.0.gem -m "rake build:010"`
		`git push`
	end
end
