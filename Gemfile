source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.0'
# gem 'rails', '~> 6.0.3', '>= 6.0.3.2'
gem 'rails', '~> 7.0.2'
gem 'pg'

# assets
gem 'bootstrap-sass', '~> 3.4.1'
gem 'coffee-rails'
gem 'jquery-rails'
gem 'jquery-validation-rails'
gem 'haml-rails'
gem 'sass-rails', '>= 6'
gem 'sassc-rails', '>= 2.1.0'
gem 'uglifier', '>= 1.3.0'

# deploy
gem 'bcrypt_pbkdf', '>= 1.0', '< 2.0'
gem 'capistrano', '~> 3.11'
gem 'capistrano-bundler', '~> 2.0'
gem 'capistrano-rails', '~> 1.4'
gem 'capistrano-passenger', '~> 0.2.0'
gem 'capistrano-rbenv', '~> 2.1', '>= 2.1.4'
gem 'ed25519', '>= 1.2', '< 2.0'
gem 'capistrano-upload', require: false

# other
gem 'bootsnap', '>= 1.4.2', require: false
gem 'jbuilder', '~> 2.7'
# gem 'puma', '~> 4.1'
gem 'puma', '~> 5'
gem 'turbolinks', '~> 5'

group :development do
  gem 'listen', '~> 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :development, :test do
  gem 'brakeman', require: false
  gem 'bundler-audit', require: false
  gem 'dotenv-rails'
end


# upds
gem 'mimemagic', '~> 0.4.3'
# gem "letter_opener", group: :development
gem 'letter_opener_web', '~> 2.0', group: :development

gem 'strscan', '1.0.3'