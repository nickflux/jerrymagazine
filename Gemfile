source 'http://rubygems.org'

gem 'rails', '3.0.9'

gem "mysql"

gem "friendly_id"
gem "aws-s3"
gem "paperclip", ">= 2.3"
gem "RedCloth"
gem "simple_form"
gem "jquery-rails", ">= 1.0.12"
gem "haml"

gem 'coffee-script'
gem 'yui-compressor', :require => 'yui/compressor'
gem 'sass'
gem 'json' # sprocket dependency for Ruby 1.8 only
gem 'sprockets', :git => 'git://github.com/sstephenson/sprockets.git'

group :production do
  gem "therubyracer"
end

group :test, :development do
  gem "rspec-rails"
  gem 'factory_girl_rails'
  gem 'capybara'
  gem 'launchy'
  gem 'database_cleaner'
  gem 'timecop'
  gem 'fakeweb'
  gem 'rb-fsevent', :require => false if RUBY_PLATFORM =~ /darwin/i
  gem 'growl'
  gem 'guard-rspec'
  gem 'guard-livereload'#, :git => 'git://github.com/guard/guard-livereload.git'
  gem 'guard-pow'
end
