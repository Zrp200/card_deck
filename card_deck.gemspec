Gem::Specification.new do |card_deck|
	File.open('VERSION.txt', 'r') {|file| card_deck.version = file.read}
	card_deck.homepage = "https://github.com/zrp200/card_deck"
	card_deck.name = "card_deck"
	card_deck.email = "zrp200@gmail.com"
	card_deck.description = "Supplies the core parts of any card game. To use the deck, call shuffle on it."
	card_deck.author = "Zachary Perlmutter"
	card_deck.summary = "The central part of a card game"
	(ENV['TRAVIS_TAG'] == "") ? card_deck.version = card_deck.version + ".pre." + ENV['TRAVIS_BUILD_NUMBER'] : card_deck.version = ENV['TRAVIS_TAG'] if ENV['TRAVIS']
	card_deck.license = "MIT"
	card_deck.add_development_dependency "rspec"
  	card_deck.add_development_dependency "rspec-its"
	card_deck.extra_rdoc_files = %w(README.md LICENSE.md)
	card_deck.files = Dir.glob "lib/**/*.rb"
end
