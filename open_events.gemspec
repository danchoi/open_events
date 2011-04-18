# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
#require "open_events/version"

Gem::Specification.new do |s|
  s.name        = "open_events"
  s.version     = "0.0.1"
  s.platform    = Gem::Platform::RUBY
  s.required_ruby_version = '>= 1.9.0'

  s.authors     = ["Daniel Choi"]
  s.email       = ["dhchoi@gmail.com"]
  #s.homepage    = "http://danielchoi.com/software/open_events.html"
  s.summary     = %q{Events listings web scrapers and tools}
  s.description = %q{An open-source repository of events listings web scrapers and tools}

  s.rubyforge_project = "open_events"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_dependency 'nokogiri'
end
