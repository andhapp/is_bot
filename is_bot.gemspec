# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{is_bot}
  s.version = "0.3.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Anuj Dutta"]
  s.date = %q{2011-06-19}
  s.description = %q{Simple gem to reduce the spam attacks on sign-up, sign-in and other similar sorts of forms.}
  s.email = %q{anuj@andhapp.com}
  s.extra_rdoc_files = [
    "LICENSE",
    "README.markdown"
  ]
  s.files = [
    ".rspec",
    "Gemfile",
    "Gemfile.lock",
    "HISTORY",
    "LICENSE",
    "README.markdown",
    "Rakefile",
    "VERSION",
    "init.rb",
    "is_bot.gemspec",
    "lib/is_bot.rb",
    "lib/is_bot/is_bot.rb",
    "pkg/is_bot-0.1.0.gem",
    "pkg/is_bot-0.2.0.gem",
    "spec/database.yml",
    "spec/is_bot_spec.rb",
    "spec/models.rb",
    "spec/schema.db",
    "spec/spec_helper.rb"
  ]
  s.homepage = %q{http://github.com/andhapp/is_bot}
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.6.2}
  s.summary = %q{Fight the bot.}

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<rails>, ["= 3.1.0.rc4"])
      s.add_runtime_dependency(%q<rspec>, ["= 2.6.0"])
      s.add_runtime_dependency(%q<sqlite3>, ["= 1.3.3"])
    else
      s.add_dependency(%q<rails>, ["= 3.1.0.rc4"])
      s.add_dependency(%q<rspec>, ["= 2.6.0"])
      s.add_dependency(%q<sqlite3>, ["= 1.3.3"])
    end
  else
    s.add_dependency(%q<rails>, ["= 3.1.0.rc4"])
    s.add_dependency(%q<rspec>, ["= 2.6.0"])
    s.add_dependency(%q<sqlite3>, ["= 1.3.3"])
  end
end

