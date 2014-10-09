Gem::Specification.new do |card_deck|
	card_deck.homepage = 'https://github.com/zrp200/card_deck'
	card_deck.name = "card_deck"
	card_deck.author = "Zachary Perlmutter"
	card_deck.summary = "The central part of a card game"
	unless ENV['TRAVIS']
		card_deck.version = "0.2.2"
	else
		card_deck.version = "0.2.2-alpha-#{ENV['TRAVIS_BUILD_NUMBER]}"
	end
	card_deck.add_development_dependency "rspec", '~> 3.0'
	card_deck.license = "MIT"
	card_deck.extra_rdoc_files = %w(README.md LICENSE)
	card_deck.files = ['lib/card_deck.rb']
end
