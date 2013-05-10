# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'socialite_js/version'

Gem::Specification.new do |gem|
  gem.name          = "socialite_js"
  gem.version       = SocialiteJs::VERSION
  gem.authors       = ["Deepak Kannan"]
  gem.email         = ["kannan.deepak@gmail.com"]

  gem.summary       = %q{Integrate socialite.js into Ruby on Rails}
  gem.description   = %q{Integrate socialite.js into Ruby on Rails. check http://socialitejs.com/}
  gem.homepage      = "https://github.com/deepak/socialite_js"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_dependency "socialite_js-source",   "= 0.0.1"
  
  gem.add_development_dependency "debugger",  "~> 1.5.0"
  
end
