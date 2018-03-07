$:.push File.expand_path('../lib', __FILE__)

# Maintain your gem's version:
require 'check_list_engine/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = 'check_list_engine'
  s.version     = CheckListEngine::VERSION
  s.authors     = ['Guy Roberts']
  s.email       = ['guy@guyroberts.co.uk']
  s.homepage    = 'https://github.com/guy-roberts/check_list_engine'
  s.summary     = 'A Rails Engine, acts as a REST API for AuditTypes and Audits. '
  s.description = 'An AuditType is a template describing a type of audit. The Audit itself has a structure described by its type.'
  s.license     = 'MIT'

  s.files = Dir['{app,config,db,lib}/**/*', 'MIT-LICENSE', 'Rakefile', 'README.md']

  s.add_dependency 'rails', '~> 5.1.4'
  s.add_dependency 'fast_jsonapi', '~> 1.0.17'

  s.add_development_dependency 'pg'
end
