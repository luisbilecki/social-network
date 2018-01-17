source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.1.4'



# Use Puma as the app server
gem 'puma', '~> 3.7'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development


#GEMS Social Network
gem 'rails-i18n'

#inputmask
gem 'jquery-inputmask-rails', github: 'knapo/jquery-inputmask-rails'

gem 'carrierwave', '~> 1.0'
gem 'mini_magick'

#JQuery UI Rails
gem 'jquery-ui-rails'

# Use jquery as the JavaScript library
gem 'jquery-rails'

# A Scope & Engine based, clean, powerful, customizable and sophisticated paginator for Ruby webapps
gem 'kaminari'
gem 'kaminari-i18n'

#Manage Procfile-based applications
gem 'foreman'

#Flexible authentication solution for Rails with Warden
gem 'devise'

#Translations for the devise gem
gem 'devise-i18n'

#FriendlyId is the “Swiss Army bulldozer” of slugging and permalink plugins for ActiveRecord.
gem 'friendly_id', '~> 5.1.0'

#Fontawesome
gem "font-awesome-rails"

gem 'acts_as_votable', '~> 0.11.1'

#PostgreSQL database
gem 'pg', '~> 0.20'

source 'https://rails-assets.org' do
  #Bootstrap notify
  gem 'rails-assets-bootstrap.growl'
  #Bootstrap
  gem 'rails-assets-bootstrap'
  #Bootbox
  gem 'rails-assets-bootbox'
end

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'selenium-webdriver'

  #Better error page for Rack apps
  gem "better_errors"
  gem "binding_of_caller"

  #TDD
  gem 'rspec-rails', '~> 3.6'
  gem 'capybara'

  gem 'factory_bot_rails', '~> 4.0'
  gem 'faker'
  gem 'httparty'
  gem 'webmock'
  gem 'vcr'
  gem 'shoulda-matchers', '~> 3.1'
  gem 'rails-controller-testing'
  gem 'selenium-webdriver'
  gem 'chromedriver-helper'
  gem 'rspec-json_expectations'

end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'

  #DoctorIpsum
  gem 'doctor_ipsum'

  #O Lero-lero Generator é uma ferramenta capaz de gerar frases que 'falam'
  # muita coisa mas que não tem conteúdo algum.
  gem 'lerolero_generator'
end

group :production do
  gem 'rails_12factor'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

# Heroku
ruby "2.4.1"
