Gem::Specification.new do |s|
  s.name = "rack-icis_identity_auth"
  s.version = "0.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Patrick Robertson"]
  s.date = "2013-04-11"
  s.description = "Middleware that allows you to authenticate header-based auth request on ICIS services."
  s.email = "patricksrobertson@gmail.com"
  s.files = [
    "README.md",
    "lib/rack/icis_identity_auth.rb",
    "rack-icis_identity_auth.gemspec",
  ]
  s.homepage = "http://github.com/patricksrobertson/rack-icis_identity_auth"
  s.licenses = ["MIT"]
  s.require_paths = ["lib"]
  s.rubygems_version = "1.8.24"
  s.summary = "Middleware for ICIS service authentication."

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<rack>, [">= 0"])
      s.add_runtime_dependency(%q<httparty>, [">= 0"])
    else
      s.add_dependency(%q<rack>, [">= 0"])
      s.add_dependency(%q<httparty>, [">= 0"])
    end
  else
    s.add_dependency(%q<rack>, [">= 0"])
    s.add_dependency(%q<httparty>, [">= 0"])
  end
end
