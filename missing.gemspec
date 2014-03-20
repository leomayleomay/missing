# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'missing/version'

Gem::Specification.new do |spec|
  spec.name          = "missing"
  spec.version       = Missing::VERSION
  spec.authors       = ["Hao Liu"]
  spec.email         = ["leomayleomay@gmail.com"]
  spec.description   = %q{Give you a hand on finding out all the missing routes in the config/routes.rb}
  spec.summary       = %q{Give you a hand on finding out all the missing routes in the config/routes.rb}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
