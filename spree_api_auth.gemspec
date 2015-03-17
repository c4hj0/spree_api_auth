# encoding: UTF-8
Gem::Specification.new do |s|
  # tracking the same version as spree master
  version = File.read(File.expand_path("../VERSION", __FILE__)).strip
  s.platform    = Gem::Platform::RUBY
  s.name        = 'spree_api_auth'
  s.version     = version
  s.summary     = 'Provides login/logout behavior for spree api'
  s.description = 'Provides an api specific sessions controller to support logging in from the api.'
  s.required_ruby_version = '>= 1.9.3'

  s.author    = 'John Morales'
  s.email     = 'jmorales@gmail.com'

  #s.files       = `git ls-files`.split("\n")
  #s.test_files  = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.require_path = 'lib'
  s.requirements << 'none'

  s.add_dependency 'spree_core', '~> 3.1.0.beta'

  s.add_development_dependency 'capybara', '~> 2.4'
  s.add_development_dependency 'coffee-rails'
  s.add_development_dependency 'database_cleaner'
  s.add_development_dependency 'factory_girl', '~> 4.5'
  s.add_development_dependency 'ffaker'
  s.add_development_dependency 'rspec-rails',  '~> 3.1'
  s.add_development_dependency 'sass-rails', '~> 4.0.2'
  s.add_development_dependency 'selenium-webdriver'
  s.add_development_dependency 'simplecov'
  s.add_development_dependency 'sqlite3'
end
