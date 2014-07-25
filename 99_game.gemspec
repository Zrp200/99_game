Gem::Specification.new do |config|
	config.name = "99_game"
	config.author = 'Zachary Perlmutter'
	config.email = 'zrp200@gmail.com'
	config.version = '1.3.0'
	config.summary = 'The game of 99.'
	config.description = <<YIELD
This is a text-based interpretation of the card game 99. Comes with the gem in the form of an executable. Make sure to read the rules in `99_game -h` before playing
YIELD
	config.bindir = 'bin'
	config.extra_rdoc_files = ['README.md', 'LICENSE.txt']
	config.files = ['lib/99_game.rb']
	config.required_ruby_version = '>= 1.8.0'
	config.license = 'MIT'
	config.homepage = 'https://rubygems.org/gems/99_game'
	config.test_files = ['spec/lib/99spec.rb', '.rspec', 'spec/spec_helper.rb']
	config.executables << '99_game'
	config.metadata = {"Recommended Ruby Version" => "~> 2.0.0"}
end 
