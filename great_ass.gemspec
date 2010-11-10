# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "great_ass/version"

Gem::Specification.new do |s|
  s.name        = "great_ass"
  s.version     = GreatAss::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Jonas Nicklas"]
  s.email       = ["jonas.nicklas@gmail.com"]
  s.homepage    = "http://github.com/jnicklas/great_ass"
  s.summary     = %q{Seriously well rounded asset packagement}
  s.description = %q{Show off your assets in style}

  s.rubyforge_project = "great_ass"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
