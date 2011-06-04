# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "adaptive_payments/version"

Gem::Specification.new do |s|
  s.name        = "adaptive_payments"
  s.version     = AdaptivePayments::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Mauko Quiroga"]
  s.email       = ["maukoquiroga@gmail.com"]
  s.homepage    = "http://pictorical.com"
  s.summary     = %q{Basic PayPal Adaptive Payments API Wrapper}
  s.description = %q{Basic PayPal Adaptive Payments API Wrapper}
  
  s.add_dependency "yajl-ruby"
  s.add_dependency "monster_mash"
  
  s.rubyforge_project = "adaptive_payments"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
