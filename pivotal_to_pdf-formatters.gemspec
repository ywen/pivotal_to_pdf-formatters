# -*- encoding: utf-8 -*-
require File.expand_path('../lib/pivotal_to_pdf-formatters/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Yi Wen"]
  gem.email         = ["hayafirst@gmail.com"]
  gem.description   = %q{The gem is a collection of possible formatters for the pivotal_to_pdf gem}
  gem.summary       = %q{The gem is a collection of possible formatters for the pivotal_to_pdf gem}
  gem.homepage      = "https://github.com/ywen/pivotal_to_pdf-formatters"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "pivotal_to_pdf-formatters"
  gem.require_paths = ["lib"]
  gem.version       = PivotalToPdf::Formatters::VERSION
  gem.add_runtime_dependency(%q<rainbow>)
  gem.add_development_dependency(%q<rspec>)
  gem.add_development_dependency(%q<rake>)
  gem.add_development_dependency(%q<guard-spork>)
  gem.add_development_dependency(%q<guard-rspec>)
  gem.add_development_dependency(%q<tailor>, "0.1.5")
  gem.add_development_dependency(%q<cane>)
  gem.add_development_dependency(%q<simplecov>)
  gem.add_development_dependency(%q<growl-rspec>)
end
