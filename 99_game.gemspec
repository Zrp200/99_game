Gem::Specification.new do |game|
	game.name = "99_game"
	game.author = 'Zachary Perlmutter'
	game.email = 'zrp200@gmail.com'
	game.version = '3.1.2'
	# game.version = "#{game.version}-#{ENV['TRAVIS_BUILD_NUMBER']}" if ENV['TRAVIS']
	game.summary = 'The game of 99.'
	game.description = <<YIELD
This is a text-based interpretation of the card game 99. Comes with the gem in the form of an executable. Make sure to read the rules in `99_game -h` before playing.
YIELD
	game.add_runtime_dependency "card_deck", "~> 1.1"
	game.bindir = 'bin'
	game.extra_rdoc_files = %w(README.md LICENSE.txt)
	game.files = %w(lib/99_game.rb)
	game.license = 'MIT'
	game.homepage = 'https://rubygems.org/gems/99_game'
	game.test_files = %w(spec/lib/99_game_spec.rb .rspec spec/spec_helper.rb)
	game.executables << '99_game'
	game.required_ruby_version = '>= 1.9.2'
end
