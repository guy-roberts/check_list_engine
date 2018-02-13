$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "check_list_engine/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "check_list_engine"
  s.version     = CheckListEngine::VERSION
  s.authors     = ["Guy Roberts"]
  s.email       = ["groberts2001@hotmail.com"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of CheckListEngine."
  s.description = "TODO: Description of CheckListEngine."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency "rails", "~> 5.1.4"

  s.add_development_dependency "sqlite3"
end
