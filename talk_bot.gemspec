$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "talk_bot/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "talk_bot"
  s.version     = TalkBot::VERSION
  s.authors     = ["TODO: Your name"]
  s.email       = ["TODO: Your email"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of TalkBot."
  s.description = "TODO: Description of TalkBot."

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.0.4"
  s.add_dependency "haml-rails"

  s.add_dependency 'twilio-ruby'
  s.add_dependency 'jquery-rails'
  s.add_dependency 'haml-rails'
  s.add_dependency 'sass-rails'
  s.add_dependency 'bootstrap-sass'
  s.add_dependency 'capistrano'


  s.add_development_dependency "sqlite3"
end
