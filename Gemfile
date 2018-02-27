source 'https://rubygems.org'

# Declare your gem's dependencies in check_list_engine.gemspec.
# Bundler will treat runtime dependencies like base dependencies, and
# development dependencies will be added by default to the :development group.
gemspec

# Declare any dependencies that are still in development here instead of in
# your gemspec. These might include edge Rails or gems from your path or
# Git. Remember to move these dependencies to your gemspec before releasing
# your gem to rubygems.org.

# To use a debugger
# gem 'byebug', group: [:development, :test]


# Use postgresql as the database for Active Record
gem 'pg', '~> 0.18'
# Use Puma as the app server
gem 'puma', '~> 3.0'

gem 'active_model_serializers', '~> 0.10.0'
gem 'simplecov', :require => false, :group => :test

gem 'json', github: 'flori/json', branch: 'v1.8'

group :development, :test do

  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platform: :mri

  gem 'rspec', '~> 3.7'
  gem 'rspec-rails', '~> 3.7.2'

  gem 'factory_bot'

  gem 'database_cleaner', '~> 1.5.3'

  gem 'rack-test'

  gem 'rubocop'

end
