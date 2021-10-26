source ENV['CIRCLECI'] ? 'https://rubygems.org' : 'https://gems.ruby-china.com'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.0.6'
gem 'pg', '~> 0.18'
gem 'puma', '~> 3.12'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development
gem 'slim-rails'

gem 'graphql'
gem 'graphql-errors'

gem 'activeadmin'
gem 'awesome_nested_set'
gem 'devise'
gem 'figaro'
gem 'sidekiq'

group :development, :test do
  gem 'pry'
  gem 'pry-rails'
  gem 'rspec-rails'
  gem 'rspec_junit_formatter'
  gem 'factory_bot'
  gem 'factory_bot_rails'
  gem 'graphiql-rails'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '~> 3.0.5'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'

  gem "capistrano", "~> 3.10", require: false
  gem 'capistrano-rbenv'
  gem 'capistrano-rails', '~> 1.1'
  gem 'capistrano-rails-db'
  gem 'capistrano3-puma'
  gem 'capistrano-bundler'
  gem 'capistrano-faster-assets'
  gem 'capistrano-upload-config'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
