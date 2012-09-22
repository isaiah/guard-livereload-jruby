# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
$:.push File.expand_path("../ext", __FILE__)
require 'WebSocket.jar'
require 'guard/livereload/version'

Gem::Specification.new do |s|
  s.name        = "guard-livereload-jruby"
  s.version     = Guard::LiveReloadVersion::VERSION
  s.platform    = "java"
  s.authors     = ['Isaiah Peng']
  s.email       = ['issaria@gmail.com']
  s.homepage    = 'http://rubygems.org/gems/guard-livereload-jruby'
  s.summary     = 'Guard gem for livereload(jruby version)'
  s.description = "Guard::LiveReload automatically reloads your browser when 'view' files are modified."

  s.required_rubygems_version = '>= 1.3.6'

  s.add_dependency 'guard',        '>= 1.1.0'

  s.add_development_dependency 'bundler',     '~> 1.0'
  s.add_development_dependency 'rspec',       '~> 2.10'
  s.add_development_dependency 'guard-rspec', '~> 1.0'

  s.files        = Dir.glob('{lib,ext,vendor}/**/*') + %w[LICENSE README.md]
  s.require_path = 'lib'
end
