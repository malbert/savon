# -*- encoding : utf-8 -*-
lib = File.expand_path("../lib", __FILE__)
$:.unshift lib unless $:.include? lib

require "savon/version"

Gem::Specification.new do |s|
  s.name        = "savon"
  s.version     = Savon::VERSION
  s.authors     = "Daniel Harrington"
  s.email       = "me@rubiii.com"
  s.homepage    = "http://savonrb.com"
  s.summary     = "Heavy metal SOAP client"
  s.description = s.summary
  s.required_ruby_version = '>= 1.9.2'

  s.rubyforge_project = s.name
  s.license = 'MIT'

  s.add_dependency "nori",     "~> 2.4"
  s.add_dependency "httpi",    "~> 4.0"
  s.add_dependency "wasabi",   "~> 5.1"
  s.add_dependency "akami",    "~> 1.2"
  s.add_dependency "gyoku",    "~> 1.2"
  s.add_dependency "builder",  ">= 2.1.2"
  s.add_dependency "nokogiri", ">= 1.8.1"
  s.add_dependency "mail",     "~> 2.5"

  s.add_development_dependency "rack"
  s.add_development_dependency "puma",  "~> 3.0"

  s.add_development_dependency "rake",  "~> 10.1"
  s.add_development_dependency "rspec", "~> 2.14"
  s.add_development_dependency "mocha", "~> 0.14"
  s.add_development_dependency "json",  "~> 1.7"

  ignores  = File.readlines(".gitignore").grep(/\S+/).map(&:chomp)
  dotfiles = %w[.gitignore .travis.yml .yardopts]

  all_files_without_ignores = Dir["**/*"].reject { |f|
    File.directory?(f) || ignores.any? { |i| File.fnmatch(i, f) }
  }

  s.files = (all_files_without_ignores + dotfiles).sort

  s.require_path = "lib"
end
