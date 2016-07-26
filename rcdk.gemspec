# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rcdk/version'

Gem::Specification.new do |spec|
  spec.name          = "rcdk"
  spec.version       = Rcdk::VERSION
  spec.authors       = ["Nils Woetzel","Lihua","Richard Apodaca"]
  spec.email         = ["nils.woetzel@h-its.org"]

  spec.summary       = %q{This gem wrap the Chemistry development kit for use in ruby.}
  spec.description   = %q{The Chemistry Development Kit is written in Java. This gem provides an interface to common function of the CDK using the rjb (ruby-java-bridge) gem.}
  spec.homepage      = "https://github.com/HITS-SDBV/rcdk"
  spec.license       = "GPL"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "" #"TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.12"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest", "~> 5.0"

  spec.add_dependency "rjb", ">= 1.0.0"
end
