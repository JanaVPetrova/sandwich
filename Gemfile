# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.3'

gem 'aasm'
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 4.1'
gem 'rails', '~> 6.0.3', '>= 6.0.3.7'
gem 'sass-rails', '>= 6'
gem 'webpacker'

gem 'bcrypt', '~> 3.1.7'
gem 'bootstrap', '~> 5.0.1'
gem 'hotwire-rails'
gem 'interactor'
gem 'jbuilder', '~> 2.7'
gem 'kaminari'
gem 'redis'
gem 'russian'
gem 'shrine'
gem 'slim'
gem 'sprockets-rails', require: 'sprockets/railtie'
gem 'stimulus-rails'
gem 'turbo-rails'

gem 'image_processing', '~> 1.2'

gem 'bootsnap', '>= 1.4.2', require: false

group :development, :test do
  gem 'factory_bot_rails'
  gem 'faker'
  gem 'pry-byebug'
  gem 'rspec-rails'
  gem 'rubocop', require: false
  gem 'rubocop-performance', require: false
  gem 'rubocop-rails', require: false
  gem 'rubocop-rspec', require: false
end

group :test do
  gem 'database_cleaner-active_record'
end

group :development do
  gem 'listen', '~> 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'web-console', '>= 3.3.0'
end

gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
