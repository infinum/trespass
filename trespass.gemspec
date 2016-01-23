# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'trespass/version'

Gem::Specification.new do |spec|
  spec.name          = 'trespass'
  spec.version       = Trespass::VERSION
  spec.authors       = ['Damir Svrtan']
  spec.email         = ['damir.svrtan@gmail.com']

  spec.summary       = 'Test your non ActiveRecord Queries for SQL Injections'
  spec.description   = 'Test your non ActiveRecord Queries for SQL Injections'
  spec.homepage      = 'https://github.com/infinum/trespass'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end

  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.11'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'activerecord', '>= 4.0.0'
  spec.add_development_dependency 'sqlite3'
  spec.add_development_dependency 'pry'
  spec.add_development_dependency 'database_cleaner'
  spec.add_development_dependency 'pg', '0.18.1'
end
