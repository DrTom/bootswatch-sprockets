# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'bootswatch_sprockets/version'
require 'pry'

Gem::Specification.new do |spec|
  spec.name          = "bootswatch-sprockets"
  spec.version       = BootswatchSprockets::VERSION
  spec.authors       = ["Thomas Schank"]
  spec.email         = ["DrTom@schank.ch"]
  spec.summary       = "Bootswatch themes for the sprockets assets pipeline."
  spec.homepage      = "https://github.com/DrTom/bootswatch-sprockets"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency 'bootstrap-sass', '~> 3.3'

  spec.add_development_dependency "pry"
  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake", "~> 10.0"

  spec.files +=  \
    Dir.glob("assets/**/*scss").reject do |filename|
      filename =~ /bower_components/
    end

end
