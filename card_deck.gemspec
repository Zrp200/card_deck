Gem::Specification.new do |card_deck|
	card_deck.name = "card_deck"
	card_deck.author = "Zachary Perlmutter"
	card_deck.summary = "The central part of a card game"
	card_deck.version = "0.0.0"
	card_deck.add_development_dependency "inch", '>= 0.0.0'
	card_deck.add_development_dependency "rspec", '~> 3.0'
	card_deck.license = "MIT"
	card_deck.extra_rdoc_files = %w(README.md LICENSE)
	card_deck.files = ['lib/card_deck.rb']
end
