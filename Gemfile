# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.6'

gem 'rails', '~> 6.0.3', '>= 6.0.3.5'

gem 'bootsnap', '>= 1.4.2', require: false
gem 'cancancan'
gem 'devise'
gem 'dotenv-rails'
gem 'draper'
gem 'dry-system'
gem 'jbuilder', '~> 2.7'
gem 'paper_trail'
gem 'primer_view_components'
gem 'puma', '~> 4.1'
gem 'rails_admin', '~> 2.0'
gem 'redis-rails'
gem 'sass-rails', '>= 6'
gem 'simple_form'
gem 'sqlite3', '~> 1.4'
gem 'turbolinks', '~> 5'
gem 'view_component', require: 'view_component/engine'
gem 'webpacker', '~> 4.0'

group :development, :test do
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'rspec-rails'
  gem 'rubocop-rails'
  gem 'rubocop-rspec'
end

group :development do
  gem 'listen', '~> 3.2'
  gem 'solargraph'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'web-console', '>= 3.3.0'
end

gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
