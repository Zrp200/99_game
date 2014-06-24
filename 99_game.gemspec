Gem::Specification.new do |config|
	config.name = "99_game"
	config.author = 'Zachary Perlmutter'
	config.email = 'zrp200@gmail.com'
	config.version = '1.0.1'
	config.date = '2014-06-23'
	config.summary = 'The game of 99.'
	config.description = <<YIELD
This is a text-based interpretation of the card game 99.
YIELD
	config.bindir = 'bin'
	config.extra_rdoc_files = ['README.md']
	config.files = ['lib/99_game.rb']
	config.required_ruby_version = '>= 2.0.0'
	config.license = 'MIT'
	config.homepage = 'https://github.com/Zrp200/99_game'
	config.test_files = ['spec/99spec.rb', '.rspec', 'spec/spec_helper.rb']
	config.executables << '99_game'
end 
