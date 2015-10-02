# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'is_bot/version'

Gem::Specification.new do |spec|
  spec.name          = "is_bot"
  spec.version       = IsBot::VERSION
  spec.authors       = ["Anuj Dutta"]
  spec.email         = ["anuj@andhapp.com"]

  spec.summary       = %q{Protects web forms from spammers}
  spec.description   = %q{Simple gem to reduce the spam attacks on sign-up, sign-in and other similar sorts of forms.}
  spec.homepage      = "https://github.com/andhapp"
  spec.license       = "MIT"
  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "sqlite3"
  spec.add_development_dependency "activerecord"
  spec.add_development_dependency "actionview"
  spec.add_development_dependency "activesupport"
end
