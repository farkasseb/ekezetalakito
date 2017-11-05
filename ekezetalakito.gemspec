lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ekezetalakito/version'

Gem::Specification.new do |spec|
  spec.name          = 'ekezetalakito'
  spec.version       = Ekezetalakito::VERSION
  spec.authors       = ['Peter Krassay']
  spec.email         = ['peter.krassay@gmail.com']

  spec.summary       = 'Converts text to use UTF-8 Hungarian accents'
  spec.homepage      = 'https://github.com/farkasseb/ekezetalakito'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.executables   = 'ekezetalakito'
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.15'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
end
