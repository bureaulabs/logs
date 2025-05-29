source "https://rubygems.org"

# Core
gem "rails", "~> 8.0.2"
gem "propshaft"
gem "sqlite3", ">= 2.1"
gem "puma", ">= 5.0"
gem "importmap-rails"
gem "dartsass-rails"
gem "turbo-rails"
gem "stimulus-rails"
gem "jbuilder"
gem "tzinfo-data", platforms: %i[ windows jruby ]
gem "bootsnap", require: false
gem "thruster", require: false

# Solid trifecta
gem "solid_cache"
gem "solid_queue"
gem "solid_cable"

# Stuff
gem "bcrypt", "~> 3.1"
gem "friendly_id", "~> 5.5.0"
gem "image_processing", "~> 1.2"
gem "aws-sdk-s3", "1.170", require: false
gem "aws-sdk-core", "3.224.1"
gem "view_component"
gem "meta-tags"
gem "metainspector"

group :development, :test do
  gem "debug", platforms: %i[ mri windows ], require: "debug/prelude"
  gem "brakeman", require: false
  gem "rubocop-rails-omakase", require: false
end

group :development do
  gem "web-console"
	gem "letter_opener"
	gem "better_errors"
	gem "binding_of_caller"
	gem "dotenv"
end

group :test do
  gem "capybara"
  gem "selenium-webdriver"
end
