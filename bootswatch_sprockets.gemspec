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
    Dir.glob("vendor/bootswatch/**/*scss").reject do |filename|

      filename =~ %r{^vendor/bootswatch/bower_components}

    end.map do |scss_file|

      target_path = scss_file.gsub(%r{^vendor/bootswatch/}, "assets/stylesheets/bootswatch/")

      FileUtils.mkdir_p(File.dirname(target_path))

      lines = File.readlines(scss_file).map do |line|
        if line =~ /^\s*\$icon-font-path/
          "// #{line}"
        else
          line 
        end
      end.map do |line|
        if line =~ /^\s*\$\S+:/
          line.sub(';', ' !default;')
        else
          line
        end
      end

      File.open(target_path, 'w') do |file|
        file.write(lines.join)
      end

      target_path
    end

end
