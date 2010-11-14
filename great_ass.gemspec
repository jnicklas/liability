# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "liability/version"

Gem::Specification.new do |s|
  s.name        = "liability"
  s.version     = Liability::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Jonas Nicklas"]
  s.email       = ["jonas.nicklas@gmail.com"]
  s.homepage    = "http://github.com/jnicklas/liability"
  s.summary     = %q{Seriously well rounded asset packagement}
  s.description = %q{Show off your assets in style}

  s.rubyforge_project = "liability"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
