# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "dobro/version"

Gem::Specification.new do |s|
  s.name        = 'dobro'
  s.version     = Dobro::VERSION
  s.authors     = ['Brian Flanagan', 'Paul Campbell', 'Pat Allan']
  s.email       = ['pat@freelancing-gods.com']
  s.homepage    = 'http://github.com/hypertiny/dobro'
  s.summary     = %q{Simple, clean Rails admin interface}
  s.description = %q{A Rails Engine that provides a simple yet effective interface, perfect for admin management.}

  s.rubyforge_project = 'dobro'

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map { |f|
    File.basename(f)
  }
  s.require_paths = ['lib']

  s.add_runtime_dependency     'rails',           '~> 3.1.0rc1'
  s.add_runtime_dependency     'decent_exposure', '~> 1.0'
  s.add_runtime_dependency     'sass-rails',      '~> 3.1.0.rc'

  s.add_development_dependency 'rspec-rails', '2.6.1'
  s.add_development_dependency 'capybara',    '0.4.1.2'
  s.add_development_dependency 'combustion',  '0.1.0'
  s.add_development_dependency 'sqlite3',     '1.3.4'
end
