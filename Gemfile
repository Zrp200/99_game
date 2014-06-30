source 'https://rubygems.org'
require 'rbconfig'
if RbConfig::CONFIG['target_os'] =~ /mswin|mingw|cygwin/i
	gem 'wdm', '>= 0.1.0'
end
group :development do
  gem 'guard-rspec', require: false
end
gem 'coveralls', require: false
gem 'codeclimate-test-reporter', group: :test, require: nil