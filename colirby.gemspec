# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'colirby/version'

Gem::Specification.new do |spec|
  spec.name          = "colirby"
  spec.version       = Colirby::VERSION
  spec.authors       = ["Lucas Andión"]
  spec.email         = ["andion@gmail.com"]
  spec.description   = %q{Ruby wrapper for the 'Proyecto colibrí' API (http://proyectocolibri.es/)}
  spec.summary       = %q{Ruby wrapper for the 'Proyecto colibrí' API 
                          The 'Colibrí' project provides an API for the little OpenData
                          information on the Spanish Congress site.
                          More info on http://proyectocolibri.es }
  spec.homepage      = "http://github.com/andion/colirby"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end