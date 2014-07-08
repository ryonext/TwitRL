source 'http://rubygems.org'

gem "omniauth"
gem "omniauth-twitter"
gem "twitter"
gem "twitter-bootstrap-rails"
gem 'jquery-rails'
gem 'rails', '3.1.10'

group :assets do
  gem 'coffee-rails', '~> 3.1.1'
  gem 'sass-rails',   '~> 3.1.5'
  gem 'uglifier', '>= 1.0.3'
end
group :development, :test do
  gem "pry-rails"
  gem "rspec-rails", ">= 2.3.0"
end

group :development do
  gem 'capistrano', :require => nil
  gem 'capistrano-ext', :require => nil
  gem 'capistrano_colors'
end

group :test do
  gem "webmock"
end

group :production do
  gem 'pg'
  gem 'unicorn'
end

