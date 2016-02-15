# -*- encoding: utf-8 -*-
# stub: skinny 0.2.4 ruby lib

Gem::Specification.new do |s|
  s.name = "skinny"
  s.version = "0.2.4"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Samuel Cochran"]
  s.cert_chain = ["-----BEGIN CERTIFICATE-----\nMIIDKDCCAhCgAwIBAgIBAzANBgkqhkiG9w0BAQUFADA6MQ0wCwYDVQQDDARzajI2\nMRQwEgYKCZImiZPyLGQBGRYEc2oyNjETMBEGCgmSJomT8ixkARkWA2NvbTAeFw0x\nNTAzMTcyMjUwMjZaFw0xNjAzMTYyMjUwMjZaMDoxDTALBgNVBAMMBHNqMjYxFDAS\nBgoJkiaJk/IsZAEZFgRzajI2MRMwEQYKCZImiZPyLGQBGRYDY29tMIIBIjANBgkq\nhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAsr60Eo/ttCk8GMTMFiPr3GoYMIMFvLak\nxSmTk9YGCB6UiEePB4THSSA5w6IPyeaCF/nWkDp3/BAam0eZMWG1IzYQB23TqIM0\n1xzcNRvFsn0aQoQ00k+sj+G83j3T5OOV5OZIlu8xAChMkQmiPd1NXc6uFv+Iacz7\nkj+CMsI9YUFdNoU09QY0b+u+Rb6wDYdpyvN60YC30h0h1MeYbvYZJx/iZK4XY5zu\n4O/FL2ChjL2CPCpLZW55ShYyrzphWJwLOJe+FJ/ZBl6YXwrzQM9HKnt4titSNvyU\nKzE3L63A3PZvExzLrN9u09kuWLLJfXB2sGOlw3n9t72rJiuBr3/OQQIDAQABozkw\nNzAJBgNVHRMEAjAAMAsGA1UdDwQEAwIEsDAdBgNVHQ4EFgQU99dfRjEKFyczTeIz\nm3ZsDWrNC80wDQYJKoZIhvcNAQEFBQADggEBAFxKLjiLkMLkUmdpsAzJad/t7Jo/\nCGby/3n0WSXPBeZJfsnSdJ2qtG7iy/xqYDc1RjpKgX0RlMgeQRSE3ZDL/HZzBKDF\nazaTgG9Zk1Quu59/79Z0Sltq07Z/IeccFl5j9M+1YS8VY2mOPi9g03OoOSRmhsMS\nwpEF+zvJ0ESS5OPjtp6Sk4q1QYc0aVIthEznuVNMW6CPpTNhMAOFMaTC5AXCzJ3Q\n52G9HuhbVSTgE/I10H9qZBOE3qdP8ka/Fk0PUrux/DuUanNZgSKJokrQvRA4H9Au\nWpPA7HJYV6msWQiukoBEhfQ2l6Fl2HUwntvX3MCcFNHeJJ5ETERp9alo88E=\n-----END CERTIFICATE-----\n"]
  s.date = "2010-11-01"
  s.description = "Simple, upgradable WebSockets for Thin."
  s.email = "sj26@sj26.com"
  s.extra_rdoc_files = ["README.md", "LICENSE"]
  s.files = ["LICENSE", "README.md"]
  s.homepage = "http://github.com/sj26/skinny"
  s.licenses = ["MIT"]
  s.required_ruby_version = Gem::Requirement.new(">= 1.8.7")
  s.rubygems_version = "2.4.5.1"
  s.summary = "Thin WebSockets"

  s.installed_by_version = "2.4.5.1" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<eventmachine>, ["~> 1.0.0"])
      s.add_runtime_dependency(%q<thin>, ["< 1.7", ">= 1.5"])
      s.add_development_dependency(%q<rake>, [">= 0"])
      s.add_development_dependency(%q<rdoc>, [">= 0"])
    else
      s.add_dependency(%q<eventmachine>, ["~> 1.0.0"])
      s.add_dependency(%q<thin>, ["< 1.7", ">= 1.5"])
      s.add_dependency(%q<rake>, [">= 0"])
      s.add_dependency(%q<rdoc>, [">= 0"])
    end
  else
    s.add_dependency(%q<eventmachine>, ["~> 1.0.0"])
    s.add_dependency(%q<thin>, ["< 1.7", ">= 1.5"])
    s.add_dependency(%q<rake>, [">= 0"])
    s.add_dependency(%q<rdoc>, [">= 0"])
  end
end
