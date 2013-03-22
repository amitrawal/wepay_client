# -*- encoding: utf-8 -*-
require File.expand_path('../lib/wepay_client/version', __FILE__)

Gem::Specification.new do |s|
  s.name        = "wepay_client"
  s.version     = WepayClient::VERSION
  s.authors     = ["Amit Rawal"]
  s.email       = ["amit.rawal@in.v2solutions.com"]
  s.homepage    = ""
  s.summary     = %q{Wepay client gem}
  s.description = %q{Simple wrapper around wepay's api'}

  s.rubyforge_project = "wepay_client"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  #s.add_development_dependency('rspec', '~> 2.4')
  #s.add_development_dependency('webmock', '~> 1.6')
  s.add_runtime_dependency('faraday', ['>= 0.7', '< 0.9'])
  s.add_runtime_dependency('faraday_middleware', '~> 0.8')
  s.add_runtime_dependency('multi_json', '>= 1.0.3', '~> 1.0')
end
