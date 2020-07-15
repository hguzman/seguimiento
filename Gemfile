# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.2'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'bootstrap', '~> 4.3.1'
gem 'font-awesome-rails'
gem 'rails', '~> 6.0.1'

# Use sqlite3 as the database for Active Record
# gem 'sqlite3', '~> 1.4'
# Use pg as the database for Active Record
gem 'pg', '~> 1.2', '>= 1.2.2'
# Use Puma as the app server
gem 'puma', '~> 4.3'
# Use SCSS for stylesheets
gem 'sass-rails', '>= 6'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.7'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use Active Model has_secure_password
# gem 'bcrypt', '~> 3.1.7'

gem 'jquery-rails'

gem 'popper_js'

gem 'uglifier'

gem 'coffee-rails'

# Use Active Storage variant
# gem 'image_processing', '~> 1.2'

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.4.2', require: false

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
end

group :development do
  # Access an interactive console on exception pages or by calling 'console'
  # anywhere in the code.
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'web-console', '>= 3.3.0'
  # Spring speeds up development by keeping your application running in
  # the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  # Gema para Realizar Pruebas -->
  gem 'rspec-rails'
  # Gema que permite simular el envio de emails desde la aplicacion a los users.
  # read morein: https://github.com/ryanb/letter_opener
  gem "letter_opener", :group => :development
end

group :test do
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '>= 2.15'
  gem 'selenium-webdriver'
  # Easy installation and use of web drivers to run system tests with browsers
  gem 'shoulda-matchers'
  gem 'webdrivers'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]

gem 'devise', '~> 4.7', '>= 4.7.1'
gem 'simple_form', '~> 5.0', '>= 5.0.2'

# gemas para importar y exporta xls
gem 'caxlsx_rails'
# Very simple Roles library without any authorization
gem 'rolify', '~> 5.2'
# Gema para Generar Uploaders
gem 'carrierwave', '~> 2.0'
# Gema para Redimensionar Imagenes
gem 'mini_magick'
# Object oriented authorization for Rails applications
gem 'pundit', '~> 1.1'
# Flexible Ruby on Rails breadcrumbs plugin. https://github.com/WilHall/gretel
gem 'gretel'
# Simple javascript toast notifications http://www.toastrjs.com
gem 'toastr-rails'
# Buenas prácticas de código
gem 'rubocop', require: false
# Kaminari is a Scope & Engine paginator for Rails 4+
gem 'bootstrap4-kaminari-views'
gem 'kaminari', '~> 1.2'
# OperatorRecordable is a Rails plugin gem that makes your ActiveRecord models
# to be saved logically deleted with automatically set created_by, updated_by.
# read more in: https://github.com/yujideveloper/operator_recordable
gem 'operator_recordable'
