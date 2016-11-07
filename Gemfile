source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.4'
# Use sqlite3 as the database for Active Record
gem 'sqlite3'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'


# See https://github.com/rails/execjs#readme for more supported runtimes
gem 'therubyracer', platforms: :ruby

# Authenticate gem Devise
gem 'devise'

# Profile administrator
gem 'pundit'

# Use jquery as the JavaScript library
gem 'jquery-rails'

# Required by sprockets but not used
gem 'coffee-rails'
gem 'coffee-script'

# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'

# Use bootstrap for layout
gem 'twitter-bootstrap-rails'
gem 'bootstrap-sass'
# Use for create paginations and tables instead of data tables
gem 'wice_grid'
gem 'font-awesome-sass'
#gem 'bootstrap-datepicker-rails'

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'

# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Translate mensagens gem
gem 'rails-i18n'

# Most basic image uploader
gem 'paperclip'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'
  gem 'rspec-rails'
  gem 'factory_girl_rails'
  gem 'capybara'
  gem 'database_cleaner'
  gem 'shoulda-matchers'
end

group :test do
  gem "codeclimate-test-reporter", require: nil
  gem 'simplecov'
end

group :development do
  gem 'rubocop'
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  # Cpf faker
  gem 'cpf_faker'

  # Capistrano to automatize deploy
  gem 'capistrano-rails', '~> 1.1'

end

