# -*- encoding: utf-8 -*-
# stub: has_friendship 0.1.0 ruby lib

Gem::Specification.new do |s|
  s.name = "has_friendship"
  s.version = "0.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Sung Won Cho"]
  s.date = "2015-12-04"
  s.email = ["mikeswcho@gmail.com"]
  s.homepage = "https://github.com/sungwoncho/has_friendship"
  s.licenses = ["MIT"]
  s.rubygems_version = "2.4.5.1"
  s.summary = "Add social network friendship features to your Active Record models."

  s.installed_by_version = "2.4.5.1" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<rails>, ["~> 4.0"])
      s.add_development_dependency(%q<sqlite3>, [">= 0"])
      s.add_development_dependency(%q<rspec-rails>, [">= 0"])
      s.add_development_dependency(%q<guard-rspec>, [">= 0"])
      s.add_development_dependency(%q<shoulda>, [">= 0"])
      s.add_development_dependency(%q<generator_spec>, [">= 0"])
      s.add_development_dependency(%q<coveralls>, [">= 0"])
      s.add_development_dependency(%q<byebug>, [">= 0"])
      s.add_development_dependency(%q<tzinfo-data>, [">= 0"])
    else
      s.add_dependency(%q<rails>, ["~> 4.0"])
      s.add_dependency(%q<sqlite3>, [">= 0"])
      s.add_dependency(%q<rspec-rails>, [">= 0"])
      s.add_dependency(%q<guard-rspec>, [">= 0"])
      s.add_dependency(%q<shoulda>, [">= 0"])
      s.add_dependency(%q<generator_spec>, [">= 0"])
      s.add_dependency(%q<coveralls>, [">= 0"])
      s.add_dependency(%q<byebug>, [">= 0"])
      s.add_dependency(%q<tzinfo-data>, [">= 0"])
    end
  else
    s.add_dependency(%q<rails>, ["~> 4.0"])
    s.add_dependency(%q<sqlite3>, [">= 0"])
    s.add_dependency(%q<rspec-rails>, [">= 0"])
    s.add_dependency(%q<guard-rspec>, [">= 0"])
    s.add_dependency(%q<shoulda>, [">= 0"])
    s.add_dependency(%q<generator_spec>, [">= 0"])
    s.add_dependency(%q<coveralls>, [">= 0"])
    s.add_dependency(%q<byebug>, [">= 0"])
    s.add_dependency(%q<tzinfo-data>, [">= 0"])
  end
end
