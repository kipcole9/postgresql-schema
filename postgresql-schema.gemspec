# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'postgresql/schema/version'

Gem::Specification.new do |spec|
  spec.name          = "postgresql-schema"
  spec.version       = Postgresql::Schema::VERSION
  spec.authors       = ["Kip Cole"]
  spec.email         = ["kipcole9@gmail.com"]
  spec.summary       = %q{Add postgres specific schema support and dumper support.}
  spec.description   = %q{Support for domains, composite types, enums in Postgresql.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency   'rails', ">= 4.1"
  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
end
