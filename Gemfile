source 'https://rubygems.org'

gem 'rails', '3.2.1'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

# SGBD
gem 'pg'
# gem 'sqlite3'

# User configuration
gem 'devise'

# Test gems
group :development, :test do
  gem 'rspec-rails'
  gem 'factory_girl_rails' # replace fixtures
end

group :test do
  gem 'faker'       # generate fake names
  gem 'capybara'    # simulate user's interactions
  gem 'guard-rspec' # run tests automatically afer changes
  gem 'launchy'     # show in browser the failed rendering
end

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  # Twitter Bootstrap working with SASS
  gem 'bootstrap-sass', '~> 2.3.1.0'

  #gem 'sass-rails',   '~> 3.2.3'
  gem 'sass-rails', '~> 3.2'
  gem 'coffee-rails', '~> 3.2.1'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer'

  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails'

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSONs
# gem 'jbuilder'

# Use unicorn as the web server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'ruby-debug19', :require => 'ruby-debug'
