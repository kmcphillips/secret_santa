# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'secret_santa/version'

Gem::Specification.new do |spec|
  spec.name          = "secret_santa"
  spec.version       = SecretSanta::VERSION
  spec.authors       = ["Kevin McPhillips"]
  spec.email         = ["github@kevinmcphillips.ca"]
  spec.description   = %q{Secret Santa}
  spec.summary       = %q{Random selection of gift givers/givees in Ruby. Supports exception lists, emails, backups to file, and more.
}
  spec.homepage      = "http://github.com/kmcphillips/secret_santa"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "activesupport", "~> 4.0.1"
  # spec.add_dependency "activemodel", "~> 4.0.1"

  spec.add_development_dependency "rspec", "~> 2.14.1"
  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "pry", "~> 0.9.12.3"
  spec.add_development_dependency "rake"
end
