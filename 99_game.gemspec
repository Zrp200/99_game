Gem::Specification.new do |99_game|
	99_game.name = "99_game"
	99_game.author = 'Zachary Perlmutter'
	99_game.email = 'zrp200@gmail.com'
	99_game.version = '2.0.1'
	99_game.summary = 'The game of 99.'
	99_game.description = <<YIELD
This is a text-based interpretation of the card game 99. Comes with the gem in the form of an executable. Make sure to read the rules in `99_game -h` before playing
YIELD
	99_game.bindir = 'bin'
	99_game.extra_rdoc_files = %w(README.md LICENSE.txt)
	99_game.files = ['lib/99_game.rb']
	99_game.license = 'MIT'
	99_game.homepage = 'https://rubygems.org/gems/99_game'
	99_game.test_files = %w(spec/lib/99_game.rb .rspec spec/spec_helper.rb]
	99_game.executables << '99_game'
	99_game.metadata = {"Recommended Ruby Version" => "~> 2.0.0"}
end
