$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "nested_models/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "nested_models"
  s.version     = NestedModels::VERSION
  s.authors     = ["Enrique Vidal"]
  s.email       = ["enrique@cloverinteractive.com"]
  s.homepage    = "http://cloverinteractive.github.com/nested_models"
  s.summary     = "A simple way to add nested attributes with javascript."
  s.description = "It's helps to create nested attributes on the client side and it's form_helper independent."

  s.files       = Dir["{app,config,db,lib,vendor}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.md"]
  s.test_files  = Dir["test/**/*"]

  s.add_dependency "rails", ">= 3.1"
  s.add_development_dependency "sqlite3"
end
