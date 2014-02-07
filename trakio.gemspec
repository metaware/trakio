# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'trakio/version'

Gem::Specification.new do |spec|
  spec.name          = "trakio"
  spec.version       = TrakIO::VERSION
  spec.authors       = ["Jasdeep Singh"]
  spec.email         = ["jasdeep@metawarelabs.com"]
  spec.description   = %q{TrakIO Ruby Client Library}
  spec.summary       = %q{TrakIO Ruby Client Library}
  spec.homepage      = "http://metaware.github.io/trakio"
  spec.license       = "GPL"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]
  
  spec.add_runtime_dependency('rest-client')

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "webmock"
end
