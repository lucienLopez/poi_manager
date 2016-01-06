source 'https://rubygems.org'

gem 'rails', '4.2.1'

# Database
gem 'pg', '~> 0.18' # database engine (postgres adapter)

# Layout
gem 'foundation-rails', '~> 5.5' # CSS framework
gem 'uglifier', '~> 2.7' # javascript compressor
gem 'jquery-rails', '~> 4.0' # jquery integration
gem 'turbolinks', '~> 2.5', '>= 2.5.3' # asset caching (client side)
gem 'therubyracer', '~> 0.12', platforms: :ruby # javscript runtime

gem 'devise', '~> 3.5', '>= 3.5.2' # Users authentication

group :production do
  gem 'puma', '~> 2.14.0'
end

group :development do
  # random data generation to populate db
  gem 'faker', '~> 1.6', '>= 1.6.1'

  gem 'ruby-prof'
  gem 'byebug',platforms: [:mri, :rbx]
  gem 'rubocop'
  gem 'rails-erd'
end

