# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'core_refinements/version'

Gem::Specification.new do |spec|
  spec.name          = "core_refinements"
  spec.version       = CoreRefinements::VERSION
  spec.authors       = ["Ernie Brodeur"]
  spec.email         = ["ebrodeur@ujami.net"]
  spec.summary       = "Methods to augment the core classes in ruby."
  spec.description   = "A collection of methods that can be used to extend the basic ruby classes."
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
end
