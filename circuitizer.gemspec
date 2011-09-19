# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "circuitizer/version"

Gem::Specification.new do |s|
  s.name        = "circuitizer"
  s.version     = Circuitizer::VERSION
  s.authors     = ["Corey Purcell"]
  s.email       = ["corey.purcell@gmail.com"]
  s.homepage    = "https://github.com/coreypurcell/s9-e3"
  s.summary     = %q{A digital circuit solver that prints to DOT}
  s.description = %q{Solve digital circuits using a Ruby DSL as input and outputting DOT}

  s.required_ruby_version = ">= 1.9.2"

  s.files  = Dir.glob("{lib,spec}/**/*")
  s.files  += %w(README.md LICENSE circuitizer.gemspec)

  s.require_path = "lib"

  s.add_development_dependency "rake"
  s.add_development_dependency "rspec"
end
