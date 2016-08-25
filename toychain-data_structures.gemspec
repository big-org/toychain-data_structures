# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'toychain-data_structures/version'

Gem::Specification.new do |spec|
  spec.name          = "toychain-data_structures"
  spec.version       = ToyChain::DataStructures::VERSION
  spec.authors       = ["Jikku Jose", 'Nikhil Krishna', 'Krishna Prasad Nair', 'Rakesh BS', 'Nikhil Mohan']
  spec.email         = ["jikkujose@gmail.com", "rakeshbs@gmail.com"]
  spec.summary       = %q{Collection of data structures specific to ToyChain}
  spec.description   = %q{Collection of data structures bundled as gem for the ToyChain project}
  spec.homepage      = "https://github.com/jikkujose/toychain-data_structures/"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake", '~> 0'
end
