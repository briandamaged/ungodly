
Gem::Specification.new do |s|
  s.name        = 'ungodly'
  s.version     = '1.0.0'
  s.date        = '2014-05-11'
  s.summary     = "Rake task generator for the God gem"
  s.description = "Rake task generator for the God gem"
  s.authors     = ["Brian Lauber"]
  s.email       = 'constructible.truth@gmail.com'
  s.files       = Dir["lib/**/*.rb"]
  s.license     = "MIT"

  s.add_dependency "rake"
  s.add_dependency "god", "~> 0.13"
end

