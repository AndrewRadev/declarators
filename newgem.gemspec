require File.expand_path('../lib/declarators/version', __FILE__)

Gem::Specification.new do |s|
  s.name        = 'declarators'
  s.version     = Declarators::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ['Andrew Radev']
  s.email       = ['andrey.radev@gmail.com']
  s.homepage    = 'http://github.com/AndrewRadev/declarators'
  s.license     = 'MIT'
  s.summary     = 'Useful method decorators'
  s.description = <<-D
    A collection of method decorators that leverage the behavior of `def` in
    ruby 2.1. They accept a method name as a symbol and modify it.
  D

  s.add_development_dependency 'rspec', '>= 3.0.0'
  s.add_development_dependency 'rake'

  s.files        = Dir['{lib}/**/*.rb', 'LICENSE', '*.md']
  s.require_path = 'lib'
end
