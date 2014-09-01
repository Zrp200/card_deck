Gem::Specification.new do |cards|
	cards.name = "cards"
	cards.author = "Zachary Perlmutter"
	cards.summary = "The central part of a card game"
	cards.version = "0.0.0"
	cards.add_development_dependency "inch", '>= 0.0.0'
	cards.add_development_dependency "rspec", '>= 0.0.0'
	cards.license = "MIT"
	cards.extra_rdoc_files = ['README.md', 'LICENSE']
	cards.files = ['lib/cards.rb']
end
