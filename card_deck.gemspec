Gem::Specification.new do |card_deck|
	card_deck.homepage = "https://github.com/zrp200/card_deck"
	card_deck.name = "card_deck"
	card_deck.email = "zrp200@gmail.com"
	card_deck.description = "Supplies the core parts of any card game. To use the deck, call shuffle on it."
	card_deck.author = "Zachary Perlmutter"
	card_deck.summary = "The central part of a card game"
		card_deck.version = "0.2.3"
		card_deck.version = "#{card_deck.version}-alpha-#{ENV['TRAVIS_BUILD_NUMBER']}" if ENV['TRAVIS']
	card_deck.add_development_dependency "rspec", '~> 3.0'
	card_deck.license = "MIT"
	card_deck.extra_rdoc_files = %w(README.md LICENSE)
	card_deck.files = ['lib/card_deck.rb']
end
