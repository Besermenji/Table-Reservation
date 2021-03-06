# -*- encoding: utf-8 -*-
# stub: bookable 0.0.52 ruby lib lib/bookable lib/bookable/generators lib/bookable/generators/bookable

Gem::Specification.new do |s|
  s.name = "bookable"
  s.version = "0.0.52"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib", "lib/bookable", "lib/bookable/generators", "lib/bookable/generators/bookable"]
  s.authors = ["Srikanth", "Margo", "Jon"]
  s.date = "2013-11-07"
  s.description = "a bookings reservation gem for rails 4.0"
  s.email = ["srikanth.kunkulagunta@gmail.com", "margo@margonline.co.uk", "chewymeister88@googlemail.com"]
  s.homepage = "https://github.com/kunks001/bookable"
  s.licenses = ["MIT"]
  s.rubygems_version = "2.4.5.1"
  s.summary = "Bookable is a Rails 4.0 gem that enables you to add resource booking functionality to your Rails application. A resource can be anything that is bookable e.g. tennis court, football pitch, bowling lane, function room, conference room, office space."

  s.installed_by_version = "2.4.5.1" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<bundler>, ["~> 1.3"])
      s.add_development_dependency(%q<rake>, [">= 0"])
      s.add_runtime_dependency(%q<jbuilder>, ["~> 1.2"])
      s.add_runtime_dependency(%q<rails_12factor>, [">= 0"])
    else
      s.add_dependency(%q<bundler>, ["~> 1.3"])
      s.add_dependency(%q<rake>, [">= 0"])
      s.add_dependency(%q<jbuilder>, ["~> 1.2"])
      s.add_dependency(%q<rails_12factor>, [">= 0"])
    end
  else
    s.add_dependency(%q<bundler>, ["~> 1.3"])
    s.add_dependency(%q<rake>, [">= 0"])
    s.add_dependency(%q<jbuilder>, ["~> 1.2"])
    s.add_dependency(%q<rails_12factor>, [">= 0"])
  end
end
