source 'https://rubygems.org'

gem 'rails', '3.2.6'
gem 'bootstrap-sass', '2.0.0'
gem 'bcrypt-ruby', '3.0.1'
gem 'faker', '1.0.1'
gem 'will_paginate', '3.0.3'
gem 'bootstrap-will_paginate', '0.0.6'
gem 'devise' 
gem 'RedCloth', :require => 'redcloth'
gem 'stringex'
gem 'awesome_nested_set'
gem 'acts_as_commentable_with_threading'
gem 'paperclip', '~> 3.0'
gem 'base32-crockford', :require => 'base32/crockford'
gem "acts_as_votable", "~> 0.3.1"
gem "meta_search", '>= 1.1.0.pre'
gem 'activeadmin'
gem 'kaminari'
group :development do
  gem 'sqlite3', '1.3.5'
  gem 'annotate', '~> 2.4.1.beta'
end

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '3.2.4'
  gem 'coffee-rails', '3.2.2'
  gem 'uglifier', '1.2.3'
end

gem 'jquery-rails', '2.0.0'

group :test, :development do
  gem 'rspec-rails', '2.10.0'
  gem 'guard-rspec', '0.5.5'
  gem 'guard-spork', '0.3.2'
  gem 'spork', '0.9.0'
end

gem 'simplecov', :require => false, :group => :test

group :test do
  gem 'capybara', '1.1.2'
  gem 'factory_girl_rails', '1.4.0'
  gem 'cucumber-rails', '1.2.1', require: false
  gem 'database_cleaner', '0.7.0'
end

group :production do
  gem 'pg', '0.12.2'
end