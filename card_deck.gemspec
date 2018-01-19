File.open('VERSION.txt', 'w') {|file| file.write STDIN.gets} unless ENV['TRAVIS']
version = "4.0.0"
Gem::Specification.new do |card_deck|
	card_deck.homepage = "https://github.com/zrp200/card_deck"
	card_deck.name = "card_deck"
	card_deck.email = "zrp200@gmail.com"
	card_deck.description = "Supplies the core parts of any card game. To use the deck, call shuffle on it."
	card_deck.author = "Zachary Perlmutter"
	card_deck.summary = "The central part of a card game"
	if !ENV['TRAVIS'] then card_deck.version = version
	elsif ENV['TRAVIS_TAG'] == "" then card_deck.version = version + ".pre." + ENV['TRAVIS_BUILD_NUMBER']
	else card_deck.version = ENV['TRAVIS_TAG'] end
	card_deck.license = "MIT"
	card_deck.add_development_dependency "rspec"
  	card_deck.add_development_dependency "rspec-its"
	card_deck.extra_rdoc_files = %w(README.md LICENSE.md)
	card_deck.files = Dir.glob "lib/**/*.rb"
end
