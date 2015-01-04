Gem::Specification.new do |game|
	game.name = "99_game"
	game.author = 'Zachary Roth Perlmutter'
	game.email = 'zrp200@gmail.com'
	game.version = ENV['TRAVIS_TAG']
	game.version = ENV['TRAVIS_JOB_ID'] if ENV['TRAVIS_TAG'] == ""
	game.summary = 'The game of 99.'
	game.description = <<YIELD
This is a text-based interpretation of the card game 99. Comes with the gem in the form of an executable. Make sure to read the rules in `99_game -h` before playing.
YIELD
	game.add_runtime_dependency "card_deck", "~> 3.0"
	game.add_development_dependency "rspec", "~> 3.1"
	game.bindir = 'bin'
	game.extra_rdoc_files = Dir.glob "*.md"
	game.files = Dir.glob "lib/*.rb"
	game.license = 'MIT'
	game.homepage = 'https://rubygems.org/gems/99_game'
	game.test_files = Dir.glob "spec/**/*.rb"
	game.executables << '99_game'
	game.required_ruby_version = '>= 1.9.2'
end
