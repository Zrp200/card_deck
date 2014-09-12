
namespace 'build' do
	def build(version)
		`git pull`
		`gem build card_deck.gemspec`
		`gem install card_deck-#{version}.gem`
		`git add card_deck-#{version}.gem && git commit card_deck-#{version}.gem -m "rake build"`
		`git push`
	end
	task '000'.to_sym do; build "0.0.0"; end
	task '010'.to_sym do; build "0.1.0"
	task '011'.to_sym do; build "0.1.1"; end
end
namespace 'CardDeck::Deck' do
	
