
Gem::Specification.new do |s|
  s.name        = 'ungodly'
  s.version     = '0.9.0'
  s.date        = '2014-05-11'
  s.summary     = "Rake task generator for the God gem"
  s.description = "Rake task generator for the God gem"
  s.authors     = ["Brian Lauber"]
  s.email       = 'constructible.truth@gmail.com'
  s.homepage    = 'https://github.com/briandamaged/ungodly'
  s.files       = Dir["lib/**/*.rb"]
  s.license     = "MIT"

  s.add_dependency "rake"
  s.add_dependency "god", "~> 0.13.4"
end

