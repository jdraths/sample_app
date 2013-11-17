source 'https://rubygems.org'
ruby '2.0.0'
#ruby-gemset=railstutorial_rails_4_0

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.0.0'
# gem 'bootstrap-sass', '2.3.2.0'
gem 'font-awesome-sass'
gem 'bcrypt-ruby', '3.0.1'
gem 'faker', '1.1.2'
gem 'will_paginate', '3.0.4'
gem 'bootstrap-will_paginate', '0.0.9'
gem 'newrelic_rpm' #really meant for Rails 3...
gem 'twitter', '~> 4.8.0'
gem 'koala', '~> 1.7.0rc1' # for Facebook
gem 'fitgem' #fitbit
gem 'instagram', '~>0.10.0'
gem 'foursquare2', '~>1.9.0'
gem 'youtube_it', '~>2.1.0' # having problems with this.
gem 'google-api-client', '~>0.6.0'
gem 'omniauth-twitter', '~>1.0.0'
gem 'omniauth-facebook', '~>1.4.0'
gem 'omniauth-fitbit', '~> 1.0.2' 
gem 'omniauth-google-oauth2', '~>0.2.0' # this works.
gem 'omniauth-instagram', '~>1.0.0'
gem 'omniauth-linkedin'
gem 'omniauth-foursquare', '~>0.0.0'
gem 'omniauth-youtube', '~> 1.0.0' # having problems with this.
gem 'omniauth-identity', git: 'https://github.com/intridea/omniauth-identity.git'
gem 'simple_form', '~>3.0.0'
gem 'rollbar'
gem 'jquery-turbolinks' #used in place of $(document).on-page_load

group :development, :test do
	# Use sqlite3 as the database for Active Record
	gem 'sqlite3', '1.3.7' #HW: changed
	gem 'rspec-rails', '2.13.1'
end

group :development do
  gem 'annotate', '2.5.0'
end


group :test do
	gem 'selenium-webdriver', '2.0.0'
	gem 'capybara', '2.1.0'
	gem 'factory_girl_rails', '4.2.1'
end

# Use SCSS for stylesheets
gem 'sass-rails', '4.0.0'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '2.1.1'

# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '4.0.0'

# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails', '2.2.1'

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks', '1.1.1'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '1.0.2'

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', '0.3.20', require: false
end

group :production do
	gem 'pg', '0.15.1'
	gem 'rails_12factor', '0.0.2'
end

# Use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# Use unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano', group: :development

# Use debugger
# gem 'debugger', group: [:development, :test]
