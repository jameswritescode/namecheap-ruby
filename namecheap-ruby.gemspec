# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'namecheap/version'

Gem::Specification.new do |spec|
  spec.name          = "namecheap-ruby"
  spec.version       = Namecheap::VERSION
  spec.authors       = ["James Newton"]
  spec.email         = ["hello@jamesnewton.com"]
  spec.description   = %q{Ruby wrapper for the Namecheap API}
  spec.summary       = %q{Ruby wrapper for the Namecheap API}
  spec.homepage      = "https://github.com/jameswritescode/namecheap-ruby"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency 'httparty'

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
