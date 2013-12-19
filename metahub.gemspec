# -*- encoding: utf-8 -*-
require File.expand_path('../lib/metahub/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Brian Leonard"]
  gem.email         = ["brian@bleonard.com"]
  gem.description   = %q{Stuff with lots of repos}
  gem.summary       = %q{Stuff with lots of repos}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "metahub"
  gem.require_paths = ["lib"]
  gem.version       = Metahub::VERSION
end
