# -*- encoding: utf-8 -*-
require File.expand_path('../lib/knife-crypt/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Chris Griego"]
  gem.email         = ["cgriego@gmail.com"]
  gem.description   = %q{Commands for Chef's Knife Command to Encrypt and Decrypt Data}
  gem.summary       = gem.description
  gem.homepage      = "https://github.com/cgriego/knife-crypt"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "knife-crypt"
  gem.require_paths = ["lib"]
  gem.version       = Knife::Crypt::VERSION

  gem.add_runtime_dependency "chef", ">= 0.10.8", "< 12.14"

  gem.add_development_dependency "aruba", "~> 0.4.11"
  gem.add_development_dependency "bundler", "~> 1.0"
  gem.add_development_dependency "cucumber", "~> 1.2.0"
  gem.add_development_dependency "rake", "~> 0.9.0"
end
